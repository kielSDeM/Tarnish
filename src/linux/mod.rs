pub mod virt;
pub use virt::kali::Kali;
pub use virt::lubu::Lubuntu;
pub use virt::ubuserver::UbuServer;

pub struct StartQemu {
    qemu: String,
}

impl StartQemu {
    pub async fn qemu_virt() {
        let mut qemu_virt = StartQemu {
            qemu: String::new(),
        };
        println!(
            "Choose which system to start: \n
        1: Lubuntu \n
        2: Kali \n
        3: Ubuntu-Server \n
        4: Arch \n
        5: Exit"
        );
        qemu_virt.qemu.clear();
        std::io::stdin()
            .read_line(&mut qemu_virt.qemu)
            .expect("please enter a correct value.");
        let qemu = qemu_virt.qemu.trim();
        match qemu {
            "1" => {
                tokio::join!(Lubuntu::lubuntu(), Lubuntu::viewer(),);
            }

            "2" => {
                tokio::join!(Kali::kali(), Kali::viewer(),);
            }

            "3" => {
                tokio::join!(UbuServer::ubu(), UbuServer::viewer(),);
            }

            _ => {
                println!("Please enter correct response.")
            }
        }
    }
}
