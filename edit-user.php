<?php
require_once('functions/function.php');
needLogged();
get_header();
get_sidebar();

$id=$_GET['e'];
$sel="SELECT * FROM web_user WHERE user_id='$id'";
$Q=mysqli_query($con,$sel);
$data=mysqli_fetch_assoc($Q);

if(!empty($_POST)){
$name = $_POST['name'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$role = $_POST['role'];
$image = $_FILES['pic'];
$imageName = '';
if($image['name']!=''){
$imageName = 'user-'.time().'-'.rand(100000,10000000).'.'.pathinfo($image['name'],PATHINFO_EXTENSION);
}

if(!empty($name)){

 if(!empty($role)){
 
$update="UPDATE web_user SET user_name='$name', user_phone='$phone',user_email='$email',role_id='$role' WHERE user_id='$id'";


if(mysqli_query($con,$update)){
    if($image['name']!=''){
    $imageUpdate="UPDATE web_user SET user_photo='$imageName' WHERE user_id='$id'";
    mysqli_query($con,$imageUpdate);
  move_uploaded_file($image['tmp_name'],'uploads/'.$imageName);
  header('Location:view-user.php?v='.$id);
    }
header('Location:view-user.php?v='.$id);

}else{

  echo "Ops! User registration failed.";
}
}else{

  echo "Please select user role!";
}
}else{
  echo "please enter your name.";
}
}

?>

<div class="row">
<div class="col-md-12 main_content">
<form method="post" action="" enctype="multipart/form-data">
<div class="card">
  <div class="card-header">
      <div class="row">
          <div class="col-md-8">
                <h4 class="card_header_title"><i class="fa fa-gg-circle"></i> Update user Information</h4>
          </div>
          <div class="col-md-4 text-right">
              <a class="btn btn-sm btn-dark card_top_btn" href="all-user.php"><i class="fa fa-th"></i> All User</a>
          </div>
          <div class="clearfix"></div>
      </div>
  </div>
  <div class="card-body">
        <div class="form-group row custom_form_group">
          <label class="col-sm-3 col-form-label">Name:<span class="req_start">*</span></label>
          <div class="col-sm-7">
            <input type="text" class="form-control" id="" name="name" value="<?= $data['user_name'];?>">
          </div>
        </div> 
        <div class="form-group row custom_form_group">
          <label class="col-sm-3 col-form-label">Phone:</label>
          <div class="col-sm-7">
            <input type="text" class="form-control" id="" name="phone" value="<?= $data['user_phone'];?>">
          </div>
        </div> 
        <div class="form-group row custom_form_group">
          <label class="col-sm-3 col-form-label">Email:</label>
          <div class="col-sm-7">
            <input type="email" class="form-control" id="" name="email" value="<?= $data['user_email'];?>">
          </div>
        </div> 

        <div class="form-group row custom_form_group">
          <label class="col-sm-3 col-form-label">Username:</label>
          <div class="col-sm-7">
            <input type="text" class="form-control" id="" name="username" value="<?= $data['user_username'];?>" disabled>
          </div>
        </div> 

        <div class="form-group row custom_form_group">
          <label class="col-sm-3 col-form-label">User-Role:<span class="req_start">*</span></label>
          <div class="col-sm-7">
            <select class="form-control" id="" name="role">
              <option value="">-------</option>

              <?php  
              $selr="SELECT * FROM web_role ORDER BY role_id ASC";
              $Qr=mysqli_query($con,$selr);
              while($urole=mysqli_fetch_assoc($Qr)){


            ?>
              <option value="<?= $urole['role_id']; ?>"<?php if($urole['role_id']==$data['role_id']){echo 'selected';}?> ><?= $urole['role_name']; ?></option>
              <?php } ?>

            </select>
          </div>
        </div> 


        <div class="form-group row custom_form_group">
          <label class="col-sm-3 col-form-label">Photo:</label>
          <div class="col-sm-4">
            <input type="file" id="" name="pic">
          </div>
          <div class="col-sm-2">
          <?php if($data['user_photo']!=''){ ?>
                    <img height="40" src="uploads/<?= $data['user_photo'];?>"/>
                    <?php } else { ?>
                      <img height="40" src="images/avatar.png"/>

                      <?php } ?>

          </div>
        </div> 
  </div>
  <div class="card-footer text-center">
      <button type="submit" class="btn btn-sm btn-dark submit_btn">Update</button>
  </div>
</div>
</form>
</div>
</div>
<?php
get_footer();

?>