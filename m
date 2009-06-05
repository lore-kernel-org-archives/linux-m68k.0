From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: 2.6.29 & network stack strangeness
Date: Sat, 6 Jun 2009 02:37:35 +1000 (EST)
Message-ID: <Pine.LNX.4.64.0906060233071.16687@loopy.telegraphics.com.au>
References: <4A2936AF.4080601@bubblegen.co.uk>
 <Pine.LNX.4.64.0906060149130.16687@loopy.telegraphics.com.au>
 <4A294532.7030904@bubblegen.co.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:43518 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079AbZFEQho (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Jun 2009 12:37:44 -0400
In-Reply-To: <4A294532.7030904@bubblegen.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthew Lear <matt@bubblegen.co.uk>
Cc: linux-m68k@vger.kernel.org


My only guess would be that the network stack delayed work queues depend 
upon working timer interrupts...

But since I have no knowledge of your hardware, I don't think I'll be a 
lot of help with that.

Finn


On Fri, 5 Jun 2009, Matthew Lear wrote:

> Hi - thanks for your reply.
> 
> The problem doesn't manifest only when the DHCP lease expires and I can still
> reproduce the problem with a static IP. With or without DHCP makes no difference.
> 
> It seems to effect socket comms quite seriously (and quickly). If I run a simple
> server program on the host that listens on a socket and writes a response string
> to the socket when it receives data, and on the target I run a simple client
> program which writes a string to the socket, reads and prints the response sent
> the server, I only have to send data from client to server with a delay of 1ms
> between transmissions for a few seconds and the client program hangs on calling
> read() on the socket fd.
> 
> If I run a simple netcat test, eg
> 
> on target: nc -l -p 3333 > /dev/null
> on host: dd if=/dev/zero | nc <target-ip> 3333
> 
> ...strangely, once activity on the ethernet link as a result of the netcat test
> ceases, running netstat -a on the target hangs for several seconds, eg:
> 
> 
> ~ # nc -l -p 3333 > /dev/null &
> ~ # netstat -a
> Active Internet connections (servers and established)
> Proto Recv-Q Send-Q Local Address           Foreign Address         State
> tcp        0      0 *:login                 *:*                     LISTEN
> tcp        0      0 *:shell                 *:*                     LISTEN
> tcp        0      0 *:sunrpc                *:*                     LISTEN
> tcp        0      0 *:finger                *:*                     LISTEN
> tcp        0      0 *:auth                  *:*                     LISTEN
> tcp        0      0 *:ftp                   *:*                     LISTEN
> tcp        0      0 *:telnet                *:*                     LISTEN
> 
> <system hangs for several seconds here>
> 
> tcp        0      0 192.168.0.11:3333       gateway0:45645
> ESTABLISHED
> udp        0      0 *:ntalk                 *:*
> udp        0      0 *:sunrpc                *:*
> Active UNIX domain sockets (servers and established)
> Proto RefCnt Flags       Type       State         I-Node Path
> unix  4      [ ]         DGRAM                    111    /dev/log
> unix  3      [ ]         STREAM     CONNECTED     123
> unix  3      [ ]         STREAM     CONNECTED     122
> unix  2      [ ]         DGRAM                    120
> unix  2      [ ]         DGRAM                    114
> ~ #
> 
> I thought this was interesting. Also, after this, I have trouble entering
> characters over the serial port / console. It seems like interrupts may having
> trouble getting serviced but this may be a side-effect...
> 
> If you run the same netstat command with strace, you can see that the delay is
> caused by polling the socket following calling send:
> 
> ...
> ...
> gettimeofday({366, 470000}, NULL)       = 0
> poll([{fd=4, events=POLLOUT, revents=POLLOUT}], 1, 0) = 1
> send(4, "lJ\1\0\0\1\0\0\0\0\0\0\00211\0010\003168\003192\7in-ad"..., 43,
> 0x4000) = 43
> poll(
> 
> 
> <delay is here>
> 
> 
> [{fd=4, events=POLLIN}], 1, 5000)  = 0
> ...
> ...
> 
> --  Matt
> 
> 
> Finn Thain wrote:
> > Does the problem manifest only when the DHCP lease expires?
> > Can you reproduce the problem with a static IP?
> > 
> > Finn
> > 
> > 
> > On Fri, 5 Jun 2009, Matthew Lear wrote:
> > 
> >> Hello all,
> >>
> >> I'm running a 2.6.29 kernel on an MMU enabled m68k coldfire mcf54455 platform
> >> and I'm having some throughput problems when running network tests.
> >>
> >> The kernel boots and mounts its rootfs from flash (jffs2). udhcpc runs, obtains
> >> a lease from the dhcp server and configures eth0. Network connectivity is ok. I
> >> can ping the target from the host and vice versa.
> >>
> >> 1/
> >> If I run ping -s 1500 -i 0.0001 <target ip address> on the host pc, after
> >> several mins, the kernel reports 'unexpected interrupt from 24' which is the
> >> vector for a spurious interrupt. This message will repeat randomly (from what I
> >> saw it appeared ~ 20 times when running the ping test above for 40 mins). The
> >> mcf54455 reference manual describes a possible cause for spurious interrupts.
> >> However, this test very rarely reports any packet loss, although the max time to
> >> receive a packet can be very large indeed.
> >>
> >> 2/
> >> If I reboot, start again and run a ping flood test (ping -f) from host pc ->
> >> target, all icmp requests are acknowledged - for a while. Before the target
> >> begins to fail to respond to the icmp requests, running top shows that the
> >> ksoftirq daemon is running at ~ 5% cpu load. This is normal as it is involved in
> >> processing the deferred tasks of processing data fired up to the network stack.
> >> So when the target beings to stop responding to icmp, if I then stop the ping
> >> flood and try to ping the host from the target, there is no reply indicated by
> >> ping. However, if you do this with a packet sniffer running (eg wireshark) you
> >> can see that data is still being transmitted from the target -> host and you can
> >> see the icmp reply, only the reply from the host appears to be received ok by
> >> the fec driver but is processed by the network stack target.
> >>
> >> When in this state, a proc entry that I added to the fec driver shows that the
> >> last return value from netif_rx() (called in the fec rx interrupt handling
> >> routine) is 1, indicating that the last packet was dropped by the network stack,
> >> e.g.
> >>
> >> ~ # cat /proc/driver/fec
> >> total interrupts: 1421619
> >> last interrupt type: 2 [1=tx, 2=rx, 3=mii]
> >> total tx interrupts: 709148
> >> total rx interrupts: 712472
> >> total mii interrupts: 1
> >> last interrupt event: 0x2000000
> >> total eberr interrupts: 0
> >> total hberr interrupts: 0
> >> tx loop current count: 0
> >> tx loop last count: 1
> >> rx loop current count: 0
> >> rx loop last count: 1
> >> rx last cbd ctrl/status: 0x800
> >> rx last cbd len: 346
> >> rx last cbd buff addr: 0x40410000
> >> rx last netif_rx status: 1
> >>
> >> Strangely, wireshark still shows data being transmitted from the target
> >> -> host. I can see ARP requests and I can also see DHCP discovery packets being
> >> sent by the target when its DHCP lease expires. This all looks ok, only the
> >> reply from host -> target is never processed by the target as the network stack
> >> is in a state where it is dropping all incoming data provided to it by the driver.
> >>
> >> I believe udhcpc utilises the network device directly, ie it does not require an
> >> intermediate network protocol being implemented in the kernel (tcpdump is
> >> similar).
> >>
> >> The fec driver still seems to be running ok because I can see the ring buffer
> >> address changing when data is received. Everything seems to be ok apart from the
> >> network stack. Very strange indeed.
> >>
> >> Running network throughput tests between host and target with netcat or netperf
> >> only run for a few seconds before activity ceases.
> >>
> >> Has anybody experienced anything similar? Why does the network stack appear to
> >> be stuck and constantly dropping packets?
> >>
> >> Any feedback appreciated.
> >>
> >> Rgds,
> >> --  Matt
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
