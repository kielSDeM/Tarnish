use tokio::process::Command;
pub struct Kali {}
//This function runs the kali.bash script and starts to install kali linux.
impl Kali {
    pub async fn kali() -> std::process::ExitStatus {
        Command::new("bash")
            .current_dir("linux/virt")
            .arg("kali-run.bash")
            .spawn()
            .expect("command failed to start")
            .wait()
            .await
            .expect("command failed to start.")
    }
//This function starts kali in a vnc if it is installed.
    pub async fn viewer() -> std::process::ExitStatus {
        Command::new("bash")
            .current_dir("linux/virt")
            .arg("kali-view.bash")
            .spawn()
            .expect("command failed to start")
            .wait()
            .await
            .expect("command failed to start.")
    }
}
