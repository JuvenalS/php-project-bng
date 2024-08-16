<?php

namespace bng\Controllers;

include __DIR__ . '/../init.php';

use bng\Controllers\BaseController;
use bng\Models\AdminModel;

class Admin extends BaseController
{
    // =================================================================
    public function all_clients()
    {
        // check if session has a user with admin profile
        if (!check_session() || $_SESSION["user"]->profile != "admin") {
            header("Location: index.php");
        }

        // get all clients from all agents
        $model = new AdminModel();
        $results = $model->get_all_clients();

        printData($results);
    }

    // =================================================================
}
