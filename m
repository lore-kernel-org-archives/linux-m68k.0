From: Luis Alves <ljalvs@gmail.com>
Subject: Re: [PATCH 1/1] Changes for 68000 code integration.
Date: Fri, 27 Apr 2012 15:16:17 +0100
Message-ID: <CAGj5WxCKCm55uajG-kgmcQ2Z5dVmQdww+eXQwwLj_aW5mC_zrA@mail.gmail.com>
References: <1335481717-8652-1-git-send-email-ljalvs@gmail.com>
 <20120427073355.GA28132@cynthia.pants.nu>
 <CAGj5WxDCYXOX9Jw2zRxxb0NBJnnKkQTWj03FeY+u35EsfuiHjQ@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <CAGj5WxDCYXOX9Jw2zRxxb0NBJnnKkQTWj03FeY+u35EsfuiHjQ@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Hi all,

Thanks for the comments, answering below:


Greg:
> The CONFIG_CPU32 designator is not correct for 68x328 parts, they
> do not have a CPU32 core. They are standard 68000 cores internally.

That's true! I thought they had a CPU32 core like the 68360 and all 683xx p=
arts.
(And even if they had, the config would be wrong since CPU32 supports divul)


> Although there was no true 68000 part supported before the intention
> of the CONFIG_M68000 define was for that CPU - or any SoC type part that
> contained a true 68000 CPU core. And it would be good to keep that
> naming so it is consistent with the other 680x0 cores.

It makes a lot more sense now. I'll change the files and submit a new patch.



Geert:
> But the actual arch/m68k/platform/68000/ part is missing?

Yes, I'll send it in the next patch. I already have a fully working kernel
for my board, but since the 68000 doesn't have any on-chip peripherals the
config will be a lot 'board-dependent' I'm figuring out a way to
organize the files.
I could use some suggestions in here.
Should I use:
1) Single common files with "#ifdef CONFIG_<board>" conditionals
2) Common config in arch/m68k/platform/68000/ and board specific
=A0 =A0config in arch/m68k/platform/68000/<boardname>/
3) Other suggestion...

At the moment I'm using option 1) since I suspect there won't be many
boards using
the old 68000 (although I already have some guys asking for code).

> "CONFIG_M68XXX || CONFIG_COLDFIRE" makes me think "Isn't this always
> true?"...

Well, It is for non-mmu parts (or coldfire with mmu) but not for 68020 and =
up.


Brad:
> I believe this misrepresents the CPU32 feature set. According to the old
> paper copy I have of the Motorola CPU32 reference manual, the only
> unimplemented instructions relative to the 68020 are these:
>
> 1) Bit field instructions
> 2) Module call/return
> 3) RMW instructions (CAS/CAS2)
> 4) Coprocessor instructions
> 5) BCD instructions
>
> The 64 bit MUL and DIV variants are explicitly listed in the instruction =
set.
>
> The CPU32 is also missing some (but not all) of the addressing modes
> which were added with the 68020.
>
> I haven't worked with any of these chips in a long time, but the CPU32
> is quite a bit newer and more complicated than a 68000 or 68010. I
> did a project based on a 68332 about 15 years ago and still have all
> the printed reference manuals for that particular chip.

Thanks for the detailed description.
Just like I answered to Greg, I didn't have a clear view of the differences.


Please ignore this patch. I'll make the changes according to what was
discussed in here and submit a new one.


Thanks,
Luis Alves
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
