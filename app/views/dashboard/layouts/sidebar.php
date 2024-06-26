<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px; min-height: 100vh;">
    <a href="<?= BASEURL; ?>/dashboard" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <span class="fs-4">Dashboard</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="<?= BASEURL; ?>/dashboard" class="nav-link <?= end(explode('/', $_SERVER['REQUEST_URI'])) == 'dashboard' ? 'active' : ''; ?> text-white" aria-current="page">
                <i class="bi bi-house-door-fill me-2"></i>
                Home
            </a>
        </li>
        <li>
            <a href="<?= BASEURL; ?>/dashboard/posts" class="nav-link <?= end(explode('/', $_SERVER['REQUEST_URI'])) == 'posts' ? 'active' : ''; ?> text-white">
                <i class="bi bi-file-post me-2"></i>
                <?php if ($_SESSION['user_auth']['is_admin'] === 1 or $_SESSION['user_auth']['is_admin'] === 2) : ?>
                    User Posts
                <?php else : ?>
                    My Posts
                <?php endif; ?>
            </a>
        </li>
        <?php if ($_SESSION['user_auth']['is_admin'] === 1 or $_SESSION['user_auth']['is_admin'] === 2) : ?>
            <hr>
            <li>
                <a href="<?= BASEURL; ?>/admin/category" class="nav-link <?= end(explode('/', $_SERVER['REQUEST_URI'])) == 'category' ? 'active' : ''; ?> text-white">
                    <i class="bi bi-bookmark-dash-fill me-2"></i>
                    Category
                </a>
            </li>
        <?php endif; ?>
        <?php if ($_SESSION['user_auth']['is_admin'] === 2) : ?>
            <hr>
            <li>
                <a href="<?= BASEURL; ?>/superadmin/users_account" class="nav-link <?= end(explode('/', $_SERVER['REQUEST_URI'])) == 'users_account' ? 'active' : ''; ?> text-white">
                    <i class="bi bi-people-fill me-2"></i>
                    User Account
                </a>
            </li>
        <?php endif; ?>

    </ul>
    <hr>
    <div class="dropdown">
        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-person-circle mx-2"></i>
            <strong><?= $_SESSION['user_auth']['username']; ?></strong>
        </a>
        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
            <li><a class="dropdown-item" href="<?= BASEURL; ?>">Novan Blog</a></li>
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="<?= BASEURL; ?>/login/signout">Sign out</a></li>
        </ul>
    </div>
</div>