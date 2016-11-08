From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Tue, 8 Nov 2016 20:01:19 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611082000250.11408@nippy.intranet>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de> <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de> <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com> <alpine.LNX.2.00.1610251358330.443@nippy.intranet> <5810FA8D.4060702@yahoo.com>
 <58114F74.40408@yahoo.com> <alpine.LNX.2.00.1610271244020.21780@nippy.intranet> <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com> <alpine.LNX.2.00.1611052134280.2870@nippy.intranet> <5873dbec-38c0-7f7f-4a6b-68c5deb546be@sysam.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <5873dbec-38c0-7f7f-4a6b-68c5deb546be@sysam.it>
Resent-Message-ID: <RfNnWe9bZ2J.A.hlF.tRZIYB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/alpine.LNX.2.00.1611082000250.11408@nippy.intranet
To: Angelo Dureghello <angelo@sysam.it>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org


On Mon, 7 Nov 2016, Angelo Dureghello wrote:

> 
> I also observed issues with some kernel.org toolchains, at least for 
> coldfire the 4.9.x was producing some wrong opcode, due to incorrect gcc 
> libs used over linking.
> 
> Maybe you can try some toolchains i prepared, they are the kernel.org 
> with some packaging adjustments done by me. Let me know in case if they 
> work for you.
> 
> 
> http://sysam.it/toolchains.html

Thanks for that.

The only problem is that my fast Linux host is i686 and your compiler runs 
on x86_64. But it is a convenient way to get hold of a gcc-5.2 compiler to 
target m68k/coldfire.

I may have to build a recent cross-compiler to run on my i686 host if and 
when my gcc-4.4 build lets me down, or I get time to chase down bugs like 
the issue I have with the kernel.org compiler.

> 
> Regards,
> Angelo Durgehello
> 
