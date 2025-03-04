# LexInsight AI: Chat with SQL Database 👨‍⚖️

LexInsight AI is an AI-powered legal document analysis tool that enables users to interact with a MySQL database using natural language. Built with **Streamlit**, **LangChain**, and **Groq AI**, this application allows seamless querying and retrieval of legal data from structured databases.

---

## Features 🚀
- **Natural Language SQL Queries**: Users can interact with the database using text-based queries.
- **Secure Authentication**: Credentials must be provided to access the database.
- **AI-Powered Response Generation**: Uses **LLama-3.3-70B** from Groq for generating SQL queries.
- **Interactive Chat Interface**: Built with **Streamlit** for easy use.
- **Persistent Chat History**: Stores conversation history within the session.
- **Prompt Injection Warning**: Alerts users about SQL injection risks.

---

## Installation 🛠️

### 1. Clone the Repository
```bash
   git clone https://github.com/your-repo/LexInsightAI.git
   cd LexInsightAI
```

### 2. Set Up a Virtual Environment (Recommended)
```bash
   python -m venv venv
   source venv/bin/activate   # On macOS/Linux
   venv\Scripts\activate      # On Windows
```

### 3. Install Dependencies
```bash
   pip install -r requirements.txt
```

### 4. Set Up Environment Variables
Create a `.env` file in the root directory and add your **GROQ API Key**:
```env
GROQ_API_KEY=your_api_key_here
```

---

## Usage 🏃‍♂️

### 1. Run the Application
```bash
   streamlit run app.py
```

### 2. Provide Database Credentials
- Enter **MySQL Hostname, Username, Password, and Database Name** in the sidebar.
- Ensure the database is running before connecting.

### 3. Start Chatting
- Ask **any question** about the database.
- The AI model will generate and execute SQL queries.
- Results are displayed in the chat interface.

---

## Technologies Used 🏗️
- **Python** 🐍
- **Streamlit** for UI 🎨
- **LangChain** for AI-powered SQL queries 🤖
- **SQLAlchemy** for database connections 🗄️
- **Groq API** for LLM-based query generation ⚡
- **MySQL** for structured data storage 💾

---

## System Architecture Diagram 🏗️

To add an image of the working system, replace `your_image_path.png` with the actual image path:
```markdown
![System Flowchart](src/flowchart.png)
```

---

## Security Considerations ⚠️
- **Avoid SQL Injection**: The AI may generate queries that can be manipulated.
- **Use Read-Only Database Roles**: Limit user permissions to prevent unintended modifications.
- **Secure API Keys**: Do not share your `.env` file publicly.

---



## Contribution 🤝
Want to improve LexInsight AI? Feel free to submit **issues** and **pull requests**!

---

## Contact 📧
For any queries or collaborations, reach out via **adityadas.2005.coding@gmail.com**.

