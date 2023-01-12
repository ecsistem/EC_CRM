<?php (defined('BASEPATH')) or exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title><?= $page_title . ' | ' . $Settings->site_name; ?></title>
    <link rel="shortcut icon" href="<?= $assets ?>images/icon.png" />
    <?php if ($this->db->dbdriver != 'sqlite3') { ?>
        <script type="text/javascript">
            if (parent.frames.length !== 0) {
                top.location = '<?= site_url('login') ?>';
            }
        </script>
    <?php } ?>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes" name="viewport">
    <link href="<?= $assets ?>dist/css/styles.css" rel="stylesheet" type="text/css" />
    <?= $Settings->rtl ? '<link href="' . $assets . 'dist/css/rtl.css" rel="stylesheet" />' : ''; ?>
    <link href="<?= $assets ?>dist/css/login.css" rel="stylesheet" type="text/css" />
    <?= $Settings->rtl ? '<link href="' . $assets . 'dist/css/utillogin.css" rel="stylesheet" />' : ''; ?>
</head>

<body class="rtl rtl-inv">
    <div class="container-login100">
        <div class="login-box-body">
            <div class="login-logo">
                <a href="<?= base_url(); ?>"><?= $Settings->site_name == 'SimplePOS' ? 'Simple<b>POS</b>' : '<img src="' . base_url('uploads/' . $Settings->logo) . '" alt="' . $Settings->site_name . '" />'; ?></a>
            </div>
            <?php if ($error) { ?>
                <div class="alert alert-danger alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <?= $error; ?>
                </div>
            <?php }
            if ($message) { ?>
                <div class="alert alert-success alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <?= $message; ?>
                </div>
            <?php } ?>
            <p class="login-box-msg"><?= lang('login_to_your_account'); ?></p>
            <?= form_open("auth/login"); ?>

            <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                <input class="input100" type="text" name="identity" value="<?= set_value('identity', (DEMO ? 'admin@tecdiary.com' : '')); ?>" placeholder="<?= lang('email'); ?>">
                <span class="focus-input100"></span>
                <span class="symbol-input100">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                </span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100" type="password" name="password" value="<?= DEMO ? '12345678' : ''; ?>" placeholder="<?= lang('password'); ?>">
                <span class="focus-input100"></span>
                <span class="symbol-input100">
                    <i class="fa fa-lock" aria-hidden="true"></i>
                </span>
            </div>

            <div class="checkbox pull-left" style="margin-top: 0;">
                <div class="custom-checkbox">
                    <?php echo form_checkbox('remember', '1', TRUE, 'id="remember"'); ?>
                    <label for="remember" style="padding-left:5px;"><?= lang('remember_me') ?></label>
                </div>
            </div>

            <button type="submit" class="login100-form-btn"><?= lang('sign_in'); ?></button>

            <?= form_close(); ?>

            <div class="">
                <p>&nbsp;</p>
                <p><span><?= lang('forgot_your_password'); ?></span><br>
                    <?= lang('dont_worry'); ?> <a href="#" class="text-danger" data-toggle="modal" data-target="#myModal"><?= lang('click_here'); ?></a> <?= lang('to_reset'); ?> </p>

            </div>

        </div>
    </div>

    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <?php echo form_open("auth/forgot_password"); ?>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</i></button>
                    <h4 class="modal-title"><?= lang('forgot_password'); ?></h4>
                </div>
                <div class="modal-body">
                    <p><?= lang('forgot_password_heading'); ?></p>
                    <input type="email" name="forgot_email" placeholder="<?= lang('email'); ?>" autocomplete="off" class="form-control placeholder-no-fix">
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default pull-left" type="button"><?= lang('close'); ?></button>
                    <button class="btn btn-primary" type="submit"><?= lang('submit'); ?></button>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>

    <script src="<?= $assets ?>plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="<?= $assets ?>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?= $assets ?>plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script>
        $(function() {
            if ($('#identity').val())
                $('#password').focus();
            else
                $('#identity').focus();
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%'
            });
        });
    </script>
</body>

</html>