extern crate network_manager;

use network_manager::NetworkManager;

fn main() {
    let service_state = NetworkManager::get_service_state();

    println!("NetworkManager service state: {:?}", service_state);
}
