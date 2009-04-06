From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Tue, 07 Apr 2009 01:48:59 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904062346180.32327@zirkon.biophys.uni-duesseldorf.de>
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

> Now my git skills have been growing, I created two new branches:
>   - m68k-v2.6.29
>   - queue

Cool... 

I had to fix a merge conflict in atari_defconfig and multi_defconfig 
when pulling the m68k-v2.6.29 branch (EtherNEC builtin vs. module, which is the 
correct setting?). Looks like I better restart from a fresh clone just for the 
Debian stuff. 
 
> m68k-v2.6.29 contains commits from the following topic branches:
>   - for-2.6.30
>         Already taken by Linus, incl. mac-swim
>   - atari-aranym
>   - atari-ethernat
>   - atari-ethernec
>   - atari-scc
>   - atari-fat
>         Should this be dropped? Last time nobody spoke up to care about it

My problem with FAT as I remember it was the limitation on the cluster size to 
be less or equal to the MMU page size in 2.6. My FAT filesystems are all 
configured the wrong way... so the cluster size is too big and I could never 
test the FAT modifications in a meaningful way. 

I've reformatted one of the IDE disks on my Falcon in the meantime - I'll look 
into that problem over Easter. 

> And a few things from master, the continuous development branch:
>   - atari mouse/keyboard fixes (are they complete? IIRC not yet)

There's a bit of Eiffel emulation code missing (mouse wheel IIRC) that I could 
not test on ARAnyM at that time. My development tree has the necessary bits 
already, I just need to test them. The mouse driver (input driver part) looks 
incredibly messy as a result of all this, and could need a review. 

> If you (talking to `owners' of the stuff on the big topic branches now ;-) think
> something is finished and ready for upstream, I can squash the commits together
> using `git rebase -i' and submit them upstream...

Hint, hint ... what's the policy regarding driver duplication these days? 

Cheers,

  Michael
 
