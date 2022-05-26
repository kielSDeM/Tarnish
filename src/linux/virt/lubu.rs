use tokio::process::Command;

pub struct Lubuntu {}

impl Lubuntu {
    pub async fn lubuntu() -> std::process::ExitStatus {
        Command::new("bash")
            .current_dir("linux/virt/lubu")
            .arg("lubu-run.bash")
            .spawn()
            .expect("command failed to start")
            .wait()
            .await
            .expect("command failed to start.")
    }

    pub async fn viewer() -> std::process::ExitStatus {
        Command::new("bash")
            .current_dir("linux/virt/lubu")
            .arg("lubu-view.bash")
            .spawn()
            .expect("command failed to start")
            .wait()
            .await
            .expect("command failed to start.")
    }
}
