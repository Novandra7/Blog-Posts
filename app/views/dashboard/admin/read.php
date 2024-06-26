<?php
if (isset($_SESSION['flash'])) {
    $flashdata = $_SESSION['flash'];
    unset($_SESSION['flash']);
} else {
    $flashdata = null;
}
?>
<div class="flash-data" data-flashdata="<?= htmlspecialchars(json_encode($flashdata)); ?>"></div>

<div class="d-flex flex-column w-100 mx-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Category</h1>
    </div>

    <div class="table-responsive col-md-6">
        <button type="button" class="btn btn-primary mb-3 tampilModalTambah" data-bs-toggle="modal" data-bs-target="#tambahCategory">
            Create New Category
        </button>
        <table class="table table-striped table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col" class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php $i = 1; ?>
                <?php foreach ($data['posts'] as $category) : ?>
                    <tr>
                        <td><?= $i; ?></td>
                        <td><?= $category['name']; ?></td>
                        <td class="text-center">
                        <a href="<?= BASEURL; ?>/admin/category_edit/<?= $category['id']; ?>" class="badge bg-warning tampilModalUbah" data-bs-toggle="modal" data-bs-target="#tambahCategory" data-id="<?= $category['id']; ?>"><i class="bi bi-pencil-square"></i></a>
                            <a href="<?= BASEURL; ?>/admin/delete/<?= $category['id']; ?>" class="badge bg-danger border-0 tombol-hapus" data-pesan="Deleting a category will delete all posts based on that category"><i class="bi bi-x-circle"></i></a>
                        </td>
                    </tr>
                    <?php $i++; ?>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="tambahCategory" tabindex="-1" aria-labelledby="judulModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="judulModal">Create Category</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?= BASEURL; ?>/admin/create" method="post">
                    <input type="hidden" name="id" id="id">
                    <div class="mb-3">
                        <label for="name" class="form-label">Category Name</label>
                        <input type="text" name="name" class="form-control" id="name" placeholder="Cannot contain spaces..." required>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
            </form>
        </div>
    </div>
</div>