<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Panel</title>
    <script src="https://unpkg.com/typed.js@2.0.16/dist/typed.umd.js"></script>
    <script src="../resources/js/AdminJs.js"></script>
    <link rel="stylesheet" href="../resources/css/StudentStyle.css">
</head>

<body>
<header>
    <div class="bar">
        <nav>
            <div class="logo">
                <img src="../resources/pics/websiteLogo.png" alt="logo">
            </div>

            <ul>
                <li><a href="StudentPanel.jsp">Home</a></li>
                <li><a href="About.html">About</a></li>
                <li><a href="Contact.html">Contact</a></li>
                <li><a href="StudentViewNotification.jsp">Notification</a></li>
            </ul>
        </nav>
    </div>
</header>
<main>

    <div class="clock">
        <div class="clock-content">
            <h1 class="h" id="element"></h1>
            <div class="cursor"></div>
        </div>
        <div class="clock-time">
            <p class="display"></p>
        </div>
    </div>


    <div class="Student">
        <h1>Student</h1>
        <ul>
            <a href="EditProfile.jsp" target="_blank"><li>Edit Profile</li></a>
        </ul>
    </div>
    <div class="Quiz">
        <h1>Quiz</h1>

        <ul>

            <a href="AttemptQuizStudent.jsp" target="_blank"><li>Attempt Quizzes</li></a>
            <a href="ViewQuizzesStudent.jsp" target="_blank"><li>View Quizzes</li></a>
            <a href="ViewResultStudent.jsp" target="_blank"><li>View Result</li></a>
        </ul>
    </div>
    <div class="Course">
        <h1>Course</h1>
        <ul>
            <a href="EnrollCourse.jsp" target="_blank"><li>Enroll Course</li></a>
            <a href="DisplayEnrolledCourse.jsp" target="_blank"><li>Enrolled Courses</li></a>
            <a href="UnEnrollCourse.jsp" target="_blank"><li>UnEnroll Course</li></a>
        </ul>
    </div>
</main>
<footer>
    <p>copyright 2023</p>
</footer>
<script>
    var typed = new Typed('#element', {
        strings: ['Welcome to QuizWizHub', 'Created by', 'Maham','Hoor','Jamaima'],
        typeSpeed: 50,
        loop: Infinity,
    });
</script>
</body>

</html>