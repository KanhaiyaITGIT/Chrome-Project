<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Kanhaiya All-in-One Web App</title>

<style>
    * {
        margin: 0; padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        display: flex;
        background: #f2f2f2;
        transition: background 0.4s, color 0.4s;
    }

    /* SIDEBAR */
    .sidebar {
        width: 240px;
        height: 100vh;
        background: #1e1e1e;
        color: white;
        padding: 20px;
        position: fixed;
    }

    .sidebar h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 22px;
    }

    .sidebar a {
        display: block;
        margin: 10px 0;
        padding: 10px;
        background: #333;
        text-decoration: none;
        color: white;
        border-radius: 5px;
    }

    .sidebar a:hover {
        background: #555;
    }

    /* MAIN AREA */
    .main {
        margin-left: 260px;
        padding: 20px;
        width: calc(100% - 260px);
    }

    .card {
        background: white;
        padding: 20px;
        margin: 15px 0;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.08);
    }

    button {
        padding: 8px 12px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
    }

    button:hover {
        background: #0056b3;
    }

    input, textarea {
        width: 100%;
        padding: 10px;
        margin-top: 8px;
        border-radius: 6px;
        border: 1px solid #ccc;
    }

    /* DARK MODE */
    .dark {
        background: #111 !important;
        color: white !important;
    }

    .dark .card {
        background: #222 !important;
        color: white !important;
    }

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <h2>Kanhaiya Panel</h2>
    <a href="#clock">🕒 Live Clock</a>
    <a href="#todo">📝 To-Do List</a>
    <a href="#notes">📒 Notes</a>
    <a href="#jokes">😂 Jokes</a>
    <a href="#fun">🎮 Fun Tools</a>
    <br><br>
    <button onclick="toggleTheme()">🌙 Dark / ☀️ Light</button>
</div>

<!-- MAIN CONTENT -->
<div class="main">

    <!-- LIVE CLOCK -->
    <div class="card" id="clock">
        <h2>🕒 Live Clock</h2>
        <h1 id="clockTime" style="margin-top:10px;"></h1>
    </div>

    <!-- TODO LIST -->
    <div class="card" id="todo">
        <h2>📝 To-Do List</h2>
        <input id="todoInput" placeholder="Add new task..." />
        <button onclick="addTodo()">Add</button>
        <ul id="todoList" style="margin-top:15px;font-size:18px;"></ul>
    </div>

    <!-- NOTES -->
    <div class="card" id="notes">
        <h2>📒 Notes (Auto Save)</h2>
        <textarea id="notesArea" rows="7" placeholder="Write your notes..."></textarea>
        <p style="margin-top:8px;color:gray;">Notes autosaved in browser storage.</p>
    </div>

    <!-- JOKE GENERATOR -->
    <div class="card" id="jokes">
        <h2>😂 Random Joke Generator</h2>
        <p id="jokeText" style="margin:10px 0;font-size:18px;color:#444;">Click button to get a joke</p>
        <button onclick="getJoke()">New Joke</button>
    </div>

    <!-- FUN TOOLS -->
    <div class="card" id="fun">
        <h2>🎮 Fun Tools</h2>

        <h3>Change Background Color</h3>
        <button onclick="bgChange()">Change Color</button>
        <br><br>

        <h3>Click Counter</h3>
        <button onclick="counter()">Click Me</button>
        <p id="countResult">Clicks: 0</p>

        <h3 style="margin-top:20px;">Show Typed Text</h3>
        <input id="inputBox" placeholder="Type something..." />
        <button onclick="showText()">Show</button>
        <p id="showOutput"></p>
    </div>

</div>

<script>

    /* -------------------------
          LIVE CLOCK
    -------------------------- */
    function updateClock() {
        document.getElementById("clockTime").innerText =
            new Date().toLocaleTimeString();
    }
    setInterval(updateClock, 1000);
    updateClock();


    /* -------------------------
         TO-DO LIST
    -------------------------- */
    function addTodo() {
        let input = document.getElementById("todoInput");
        if (input.value.trim() === "") return;

        let li = document.createElement("li");
        li.textContent = input.value;
        li.style.cursor = "pointer";
        li.onclick = () => li.remove();

        document.getElementById("todoList").appendChild(li);
        input.value = "";
    }


    /* -------------------------
          NOTES AUTOSAVE
    -------------------------- */
    const notesBox = document.getElementById("notesArea");

    notesBox.value = localStorage.getItem("kanhaiyaNotes") || "";

    notesBox.addEventListener("input", () => {
        localStorage.setItem("kanhaiyaNotes", notesBox.value);
    });


    /* -------------------------
          JOKE GENERATOR
    -------------------------- */
    const jokes = [
        "Why don’t eggs tell jokes? They’d crack up!",
        "I'm on a seafood diet. I see food and I eat it!",
        "Parallel lines have so much in common. It’s a shame they’ll never meet.",
        "Why did the scarecrow win an award? He was outstanding in his field!",
        "I told my computer I needed a break, and it said 'No problem — I’ll go to sleep!'"
    ];

    function getJoke() {
        let joke = jokes[Math.floor(Math.random() * jokes.length)];
        document.getElementById("jokeText").innerText = joke;
    }


    /* -------------------------
          FUN TOOLS
    -------------------------- */

    // Background color changer
    function bgChange() {
        const colors = ["#ffdddd", "#ddffdd", "#ddeeff", "#fff0a5", "#f2d7f5"];
        document.body.style.background = colors[Math.floor(Math.random() * colors.length)];
    }

    // Click counter
    let count = 0;
    function counter() {
        count++;
        document.getElementById("countResult").innerText = "Clicks: " + count;
    }

    // Show typed text
    function showText() {
        let text = document.getElementById("inputBox").value;
        document.getElementById("showOutput").innerText = "You typed: " + text;
    }

    /* -------------------------
          DARK / LIGHT MODE
    -------------------------- */
    function toggleTheme() {
        document.body.classList.toggle("dark");
    }

</script>

</body>
</html>

