<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="container">

    <div class="row justify-content-center mt-5">

        <div class="col-md-4">

            <h3>Login</h3>

            @if(session('msg'))
                <div class="alert alert-danger">
                    {{ session('msg') }}
                </div>
            @endif

            <form method="POST" action="/auth">

                @csrf

                <div class="mb-3">

                    <input type="email"
                           name="em"
                           class="form-control"
                           placeholder="Email">

                </div>

                <div class="mb-3">

                    <input type="password"
                           name="pwd"
                           class="form-control"
                           placeholder="Password">

                </div>

                <button class="btn btn-primary">
                    Login
                </button>

            </form>

        </div>

    </div>

</body>

</html>