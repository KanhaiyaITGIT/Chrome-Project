<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kanhaiya Form | By Kanhaiya</title>

<style>
    /* GOOGLE FONT */
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

    body {
        margin: 0;
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        color: #333;
    }

    .container {
        background: white;
        width: 450px;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        padding: 30px;
        position: relative;
    }

    .container img.logo {
        width: 50px;
        position: absolute;
        top: 20px;
        right: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 25px;
        font-size: 26px;
        color: #333;
    }

    form label {
        display: block;
        font-weight: 500;
        margin-top: 15px;
    }

    form input, form select, form textarea {
        width: 100%;
        padding: 12px;
        margin-top: 6px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 15px;
        transition: border 0.3s;
    }

    form input:focus, form select:focus, form textarea:focus {
        border-color: #9b59b6;
        outline: none;
    }

    .skills-box {
        padding: 10px;
        background: #f2f4f7;
        border-radius: 8px;
        margin-top: 6px;
    }

    .skills-box input {
        margin-right: 6px;
        margin-top: 6px;
    }

    button {
        width: 100%;
        padding: 14px;
        margin-top: 20px;
        background: #9b59b6;
        color: white;
        font-size: 17px;
        font-weight: 500;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #8e44ad;
    }

    /* Popup */
    .popup {
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.6);
        display: none;
        justify-content: center;
        align-items: center;
        z-index: 100;
    }

    .popup-box {
        background: white;
        width: 360px;
        padding: 25px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    }

    .popup-box button {
        margin-top: 15px;
        width: 100px;
        padding: 10px;
    }

    @media (max-width: 500px){
        .container { width: 90%; padding: 20px; }
        .popup-box { width: 90%; }
    }
</style>
</head>
<body>

<div class="container">
    <!-- Logo -->
    <img src="https://via.placeholder.com/50" class="logo" alt="Logo">

    <h1>Kanhaiya Form<br><span style="font-size:16px;color:#9b59b6;">by Kanhaiya</span></h1>

    <form id="regForm">

        <label>Full Name</label>
        <input type="text" id="name" placeholder="Enter your full name" required>

        <label>Email</label>
        <input type="email" id="email" placeholder="example@gmail.com" required>

        <label>Phone</label>
        <input type="tel" id="phone" placeholder="9876543210" required>

        <label>Gender</label>
        <select id="gender" required>
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>

        <label>Country</label>
        <select id="country" required>
            <option value="">Select Country</option>
            <option>India</option>
            <option>USA</option>
            <option>UK</option>
            <option>Canada</option>
            <option>Australia</option>
        </select>

        <label>Skills</label>
        <div class="skills-box">
            <input type="checkbox" value="HTML"> HTML <br>
            <input type="checkbox" value="CSS"> CSS <br>
            <input type="checkbox" value="JavaScript"> JavaScript <br>
            <input type="checkbox" value="Python"> Python <br>
        </div>

        <label>Short Bio</label>
        <textarea id="bio" placeholder="Write something about yourself..."></textarea>

        <label>Upload File</label>
        <input type="file" id="file">

        <button type="submit">Submit</button>

    </form>
</div>

<!-- Popup -->
<div class="popup" id="popup">
    <div class="popup-box">
        <h3>Form Submitted Successfully 🎉</h3>
        <p id="resultText"></p>
        <button onclick="closePopup()">Close</button>
    </div>
</div>

<script>
document.getElementById("regForm").addEventListener("submit", function(e){
    e.preventDefault();

    let name = document.getElementById("name").value.trim();
    let email = document.getElementById("email").value.trim();
    let phone = document.getElementById("phone").value.trim();
    let gender = document.getElementById("gender").value;
    let country = document.getElementById("country").value;
    let bio = document.getElementById("bio").value.trim();

    let skills = [];
    document.querySelectorAll(".skills-box input:checked").forEach(x => skills.push(x.value));

    if(!name || !email || !phone || !gender || !country){
        alert("Please fill all required fields!");
        return;
    }

    let result =
        "Name: " + name + "<br>" +
        "Email: " + email + "<br>" +
        "Phone: " + phone + "<br>" +
        "Gender: " + gender + "<br>" +
        "Country: " + country + "<br>" +
        "Skills: " + skills.join(", ") + "<br>" +
        "Bio: " + bio;

    document.getElementById("resultText").innerHTML = result;
    document.getElementById("popup").style.display = "flex";
});

function closePopup(){
    document.getElementById("popup").style.display = "none";
}
</script>
<H1> Designed by kanhaiya </H1>
</body>
</html>

