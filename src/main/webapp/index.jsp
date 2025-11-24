<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kanhaiya Registration Form</title>

<style>
    body {
        background: #e9ecf3;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        padding: 40px;
    }

    .form-container {
        width: 450px;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
    }

    label {
        font-weight: bold;
        display: block;
        margin-top: 15px;
    }

    input, select, textarea {
        width: 100%;
        padding: 12px;
        margin-top: 8px;
        border-radius: 8px;
        border: 1px solid gray;
        font-size: 16px;
    }

    textarea {
        resize: none;
        height: 110px;
    }

    .skills-box {
        margin: 10px 0;
        padding: 10px;
        border-radius: 8px;
        background: #f2f4f7;
    }

    button {
        margin-top: 20px;
        padding: 12px;
        background: #007bff;
        width: 100%;
        font-size: 18px;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
    }

    button:hover {
        background: #0056b3;
    }

    /* POPUP */
    .popup {
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.5);
        display: none;
        justify-content: center;
        align-items: center;
    }

    .popup-box {
        background: white;
        width: 350px;
        padding: 20px;
        border-radius: 10px;
    }

</style>
</head>

<body>

<div class="form-container">
    <h2>Registration Form</h2>

    <form id="regForm">

        <label>Full Name</label>
        <input type="text" id="name" placeholder="Enter your name">

        <label>Email</label>
        <input type="email" id="email" placeholder="example@gmail.com">

        <label>Phone</label>
        <input type="tel" id="phone" placeholder="9876543210">

        <label>Gender</label>
        <select id="gender">
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>

        <label>Country</label>
        <select id="country">
            <option value="">Choose Country</option>
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
        <textarea id="bio" placeholder="Write something..."></textarea>

        <label>Upload File</label>
        <input type="file" id="file">

        <button type="submit">Submit</button>
    </form>
</div>




<!-- POPUP -->
<div class="popup" id="popup">
    <div class="popup-box">
        <h3>Form Submitted 🎉</h3>
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

    // Collect skills
    let skills = [];
    document.querySelectorAll(".skills-box input:checked").forEach(x => {
        skills.push(x.value);
    });

    // Validation
    if(!name || !email || !phone || !gender || !country){
        alert("Please fill all required fields!");
        return;
    }

    // Create preview text
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

</body>
</html>

