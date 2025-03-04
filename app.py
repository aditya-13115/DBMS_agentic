import streamlit as st
from pathlib import Path
from langchain.agents import create_sql_agent
from langchain.sql_database import SQLDatabase
from langchain.agents.agent_types import AgentType
from langchain.callbacks import StreamlitCallbackHandler
from langchain.agents.agent_toolkits import SQLDatabaseToolkit
from sqlalchemy import create_engine
from langchain_groq import ChatGroq
from dotenv import load_dotenv
import os

load_dotenv()
api_key = os.getenv("GROQ_API_KEY")

st.set_page_config(page_title="LexInsight AI : Chat with SQLDB", page_icon="👨‍⚖️")
st.title("👨‍⚖️LexInsight AI : Chat with SQLDB")

INJECTION_WARNING = '''
                SQL agent can be vulnerable to prompt injections. Use DB role with llm 
'''


MYSQL = "USE_MYSQL"
db_uri = MYSQL
mysql_host = st.sidebar.text_input("Provide MySQL HostName.")
mysql_user = st.sidebar.text_input("Provide MySQL USer.")
mysql_password = st.sidebar.text_input("Provide MySQL Password.", type="password")
mysql_db = st.sidebar.text_input("Provide MySQL DB name.")


# LLM model
model = ChatGroq(api_key=api_key, model="llama-3.3-70b-versatile", streaming=True)

@st.cache_resource(ttl="2hr") #ttl = Total Time Limit
def configure_db(db_uri, mysql_host = None, mysql_user = None, mysql_password = None, mysql_db = None):
    if not (mysql_host and mysql_user and mysql_password and mysql_db):
        st.error("Please add all the credentials.")
        st.stop()
    return SQLDatabase(create_engine(f'mysql+mysqlconnector://{mysql_user}:{mysql_password}@{mysql_host}/{mysql_db}'))


db = configure_db(db_uri, mysql_host, mysql_user, mysql_password, mysql_db)


#Toolkit
toolkit = SQLDatabaseToolkit(db=db, llm=model)

agent = create_sql_agent(
    llm=model,
    toolkit=toolkit,
    verbose=True,
    agent_type=AgentType.ZERO_SHOT_REACT_DESCRIPTION
)

if "messages" not in st.session_state or st.sidebar.button("Clear Message History."):
    st.session_state["messages"] = [{"role":"assistant", "content":"How can I help you?"}]

for msg in st.session_state.messages:
    st.chat_message(msg["role"]).write(msg["content"])

user_query = st.chat_input(placeholder="Ask anything from the database.")

if user_query:
    st.session_state.messages.append({"role":"user","content":user_query})
    st.chat_message("user").write(user_query)


    with st.chat_message("assistant"):
        streamlit_callback = StreamlitCallbackHandler(st.container())
        response = agent.run(user_query,callbacks=[streamlit_callback])
        st.session_state.messages.append({"role":"assistant","content":response})
        st.write(response)