<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .khoi {
            border: 1px solid black;
            border-radius: 10px;
            width: 250px;
            margin: 20px auto;
            background-color: antiquewhite;
        }
        input {
            padding: 5px 0;
            margin: 10px 0;
        }

        form {
            padding: 10px;
        }
        h1 {
            margin: 5px 0;
            text-align: center;
        }
        p {
            font-size: 20px;
        }
    </style>
</head>
<body>
    <h1>Thêm tài khoản</h1>
    <form action="" method="post">
        <div class="">
            <input type="text" name="tenDangNhap" placeholder="Tên đăng nhập">
        </div>
        <div class="">
            <input type="password" name="matKhau" placeholder="Mật khẩu">
        </div>
        <div class="">
            <input type="email" name="email" placeholder="Email">
        </div>
        <div class="">
            <input type="text" name="hoten" placeholder="Họ và tên">
        </div>
        <div class="">
            <input type="date" name="ngaySinh" placeholder="Ngày sinh">
        </div>
        <div class="">
            <input type="text" name="soDienThoai" placeholder="Số điện thoại">
        </div>
        <div class="">
            <input type="radio" name="gioiTinh" value="1"> Nam
            <input type="radio" name="gioiTinh" value="0"> Nữ
        </div>
    </form>

    <?php 
        if (isset($_POST['tenDangNhap']) &&
            isset($_POST['matKhau']) &&
            isset($_POST['email']) &&
            isset($_POST['hoten']) &&
            isset($_POST['ngaySinh']) &&
            isset($_POST['sdt']) &&
            isset($_POST['sdt'])
        ) {
            $tenDangNhap = $_POST['tenDangNhap'];
            $matKhau = $_POST['matKhau'];
            $email = $_POST['email'];
            $hoten = $_POST['hoten'];
            $ngaySinh = $_POST['ngaySinh'];
            $sdt = $_POST['sdt'];
            $giotTinh = $_POST['giotTinh'];

            if (!empty($tenDangNhap) && !empty($matKhau) && 
                !empty($email) && 
                !empty($hoten) && 
                !empty($ngaySinh) && 
                !empty($sdt)
                // người dùng điền đủ thông tin
            ) {
                $sql = "INSERT INTO nguoi_dung(ten_dang_nhap, mat_khau, email, ho_ten, ngay_sinh, so_dien_thoai) 
                VALUES('$tenDangNhap', '$matKhau', '$email', '$hoten', '$ngaySinh', '$sdt')";
                $result = mysqli_query($conn, $sql);

                if ($result) {
                    header('Location: index.php?page_layout=taikhoan');
                } else {
                    echo 'Thêm tài khoản thất bại';
                }
                
            } else {
                echo "<p style='color:red'>Vui lòng nhập đủ thông tin</p>";
            }
        }
    ?>
</body>
</html>