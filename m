From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Tue, 14 Apr 2009 09:50:50 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi Geert,

>   - atari-fat
>         Should this be dropped? Last time nobody spoke up to care about it

The only GEMDOS FAT partition I could mount using this code was a 16 MB one 
which would have been correctly detected as 16 bit FAT by the generic code 
anyway. The 12 bit FAT fallback (which is the main point of the code) fails 
because of the FAT table overflow check later on. The only way the FAT can be 
prevented from overflowing is using a logical sector size larger than 4k (and 
that's impossible on Linux). 

So the whole thing seems a bit pointless to have. I have no legacy GEMDOS 
filesystems that might benefit from having this code, so I cannot be sure it is 
totally pointless. If someone could provide a disk image to test in ARAnyM, I'd 
be happy to give it a try. 

At the very least, the default should be changed to atari=off on modern systems 
like the CT60:
 
Using the wrong mount option on 2.6.29 refused to mount a regular MSDOS fat 
volume as GEMDOS volume (number of clusters too big for FAT), whereas 2.4.30 
happily mounted it (and scribbled the files in random places - had me spooked 
trying to boot the new kernel off it). 

	Michael
