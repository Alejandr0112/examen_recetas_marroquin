<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title') - Recetas</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #2d251d;
            background: #f7f3ec;
        }

        nav {
            padding: 18px 32px;
            color: #fff;
            background: #9b3d20;
            font-size: 22px;
            font-weight: 700;
        }

        main {
            max-width: 980px;
            margin: 32px auto;
            padding: 0 20px;
        }
    </style>
</head>
<body>
    <nav>Recetas</nav>

    <main>
        @yield('content')
    </main>
</body>
</html>
