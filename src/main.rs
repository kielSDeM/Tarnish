pub mod linux;
use crate::linux::StartQemu;

#[tokio::main]
async fn main() {
    StartQemu::qemu_virt().await;
}
