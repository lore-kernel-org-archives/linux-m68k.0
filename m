From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: cirrusfb: Picasso 4 card
Date: Thu, 5 Mar 2009 22:01:00 +0100
Message-ID: <20090305210100.GA6524@chumley.debian.net>
References: <20090224223702.86f7e129.krzysztof.h1@poczta.fm> <10f740e80902250048j31a9a2c5n5c39066ba156c10d@mail.gmail.com> <20090225093729.GA18736@chumley.debian.net> <20090304212348.7d1e7df3.krzysztof.h1@poczta.fm> <10f740e80903041346g66852195t6ba370f0d7c7a65a@mail.gmail.com> <20090305211425.2b6f7895.krzysztof.h1@poczta.fm>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090305211425.2b6f7895.krzysztof.h1@poczta.fm>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Krzysztof Helt <krzysztof.h1@poczta.fm>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

On Thu, Mar 05, 2009 at 09:14:25PM +0100, Krzysztof Helt wrote:
> Thank you Geert for all information about Zorro and Picasso4 card.
> 
> I assume I do not understand half of at (at least) so my patch may be not correct yet.
> 
> I mapped only the first 2MB of RAM (I can add another 2MB in next patch if the patch works).
> 
> The patch to add a preliminary support for Zorro II and Picasso4 card is below.
> 
> Christian, please test it if you can. This patch must be applied after -mm tree patches
> or I can send you final version of the cirrusfb.c file (it is about 70KB text).

My Amiga did not run Linux for more than a year due to some unfortunate
incident with the new disks for crest and kullervo. I haven't succeeded to
reinstall Linux yet, due to various problems, mostly time constraints. But I
have a working IDE flash disk now (maybe the SCSI drivers have been fixed in
the meantime?), and I have next week officially off, so I should be able to
get it going again. Please send me the final version of cirrusfb.c, if I get
a crosscompiler setup on a reasonable fast machine, I will give it a try.

BTW is there an AmigaOS driver to use a IDE-CF or IDE-SD adapter? I know it
will not boot from it, but it would be a nice way to transfer kernel images
to AmigaOS quickly. Especially if Linux is not running yet... in Linux, both
adapters are recognized, maybe a mountlist(?) in AOS would make it
accessible after boot as removable media?

Christian
