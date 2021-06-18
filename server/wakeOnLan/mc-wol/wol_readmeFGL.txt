WOL.EXE is a utility that turns on a computer remotely.  It broadcasts a "Wake On LAN" packet to the Network Interface Card (NIC) with the specified MAC address.  The MAC address may optionally be followed by the IP address of the network adapter that should broadcast the packet.  A port number can also be specified, although this is rarely necessary.


Example

wol 5c9d32b5f287


Example

wol 5c-9d-32-b5-f2-87 192.168.0.1


Example

wol 5C:9D:32:B5:F2:87 192.168.0.1 16962


Notes
The motherboard must support Wake On LAN.
The NIC must support Wake On LAN.
For add-on network cards, there must be a wire connecting the motherboard's WOL port to the NIC's WOL port.
The Wake On LAN feature must be enabled in the motherboard's BIOS.
The "Good Connection" light on the back of the NIC must be lit when the machine is off.
Port 12287 (0x2FFF) must be open, however we've never seen Windows block this port.
Packets cannot be broadcast across the Internet.  That's why they call it Wake On Lan, not Wake On Internet.
To find a computer's MAC address, run the MSINFO32.EXE tool that is part of Windows.  Navigate to Components > Network > Adapter.
It may be necessary to specify the adapter IP in order for the packet to pass through some switches.
