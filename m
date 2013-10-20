From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Sun, 20 Oct 2013 12:10:57 +0200
Message-ID: <CAMuHMdUkgQFBg8GJf6xsCVJ0_ciVs+HvtySh8YnvAeVHp8jS4Q@mail.gmail.com>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
Resent-Message-ID: <TwOXlLI_NfD.A.gND.Ex6YSB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, tuomas.vainikka@kopteri.net, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Sun, Oct 20, 2013 at 11:37 AM, Ingo J=C3=BCrgensmann
<ij@2013.bluespice.org> wrote:
> I'm testing the ESP SCSI driver port by Tuomas and Michael to 3.12-rc4 an=
d
> got now this kernel panic during heavy disk activity (apt-get dist-upgrad=
e
> and parallel a rsync backup by BackupPC):
>
> Debian GNU/Linux jessie/sid spice ttyS0
>
> spice login: [77568.070000] *** ZERO DIVIDE ***   FORMAT=3D2
> [77568.080000] Current process id is 0
> [77568.090000] BAD KERNEL TRAP: 00000000
> [77568.100000] Modules linked in: xt_multiport iptable_filter ip_tables
> x_tables ipv6 8390 loop evdev dmasound_paula mac_hid dmasound_core
> parport_amiga soundcore parport amimouse ext3 mbcache jbd dm_mod nbd sg
> sd_mod zorro7xx 53c700 hydra amiflop a3000
> [77568.320000] PC: [<0484c33a>] sd_completed_bytes+0x90/0xe8 [sd_mod]
> [77568.330000] SR: 2000  SP: 00277e58  a2: 0027e2e4
> [77568.340000] d0: 00000000    d1: 007735a0    d2: 00000000    d3: 000000=
01
> [77568.350000] d4: 00000000    d5: 007735a8    a0: 024dd000    a1: 024a0e=
a0
> [77568.360000] Process swapper (pid: 0, task=3D0027e2e4)
> [77568.370000] Frame format=3D2 instr addr=3D0484c336
> [77568.390000] Stack from 00277e90:
>         00000000 08100002 00000000 00000001 00200028 00000004 0249d120
> 02be3090
>         0272c9e0 00000000 007735a0 00277f04 0484c5f8 0249d120 00277f30
> 0000000a
>         00276000 00000100 00200000 00000004 0249d120 00001000 02460614
> 002b9480
>         00002002 00000bb8 0249d100 70040200 00000000 024dd400 0013f838
> 0249d120
>         00277f30 002b9480 00276000 001d38e2 000e1cec 0249d120 00000001
> 00276000
>         00277f30 00277f30 0002c8da 002b9480 00272704 0000000f 00002598
> 08031470
> [77568.950000] Call Trace: [<0484c5f8>] sd_done+0x1d6/0x2aa [sd_mod]

My first guess was that commit ea077b1b96e073eac5c3c5590529e964767fc5f7
("m68k: Truncate base in do_div()") was missing, but this is 3.12-rc4, so i=
t
should be included.

BIG FAT WARNING for Thorsten: 3.10.7 does _not_ have this fix!
It was only backported ase5a16a446ef5bdb37214b100b93e59ac75e8a445 in
3.10.8.

> [77569.190000] Code: 4a80 6704 4c42 0001 2c01 2207 4c42 1406 <2c00> 2e01 =
2004 2204 6704 4c42 0001 2801 2205 4c42 1404 2800 2a01 202e fff8 222e

However, the addresses and the code above don't match the kernel image in
linux-3.12.0-rc4-amiga-m68k.tar.gz?

Can we get the image somewhere?

Apart from that, since the division is:

                /* be careful ... don't want any overflows */
                u64 factor =3D scmd->device->sector_size / 512;
                do_div(start_lba, factor);
                do_div(end_lba, factor);

(yes, the "u64 factor" is the issue without Andreas's fix), it could still =
be
an ESP bug, if scmd->device->sector_size turns out to be less than 512
(e.g. 0).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
