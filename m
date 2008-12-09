From: Allon Stern <allon.stern@argonst.com>
Subject: Re: Re: Merge headerfiles for m68k and m68knommu to
	arch/m68k/include/asm
Date: Tue, 9 Dec 2008 11:54:05 -0500
Message-ID: <2929E10F-8611-41C9-8B15-C734AA7D7820@argonst.com>
References: <20081208205814.GA22697@uranus.ravnborg.org>
	<Pine.LNX.4.64.0812082359190.29640@anakin>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <Pine.LNX.4.64.0812082359190.29640@anakin>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org


On Dec 8, 2008, at 6:01 PM, Geert Uytterhoeven wrote:
>
> I think you can share a toolchain for m68k and m68knommu, at least  
> for the
> kernel (I used my plain m68k toolchain when experimenting with  
> m68knommu for
> Amiga).

The coldfire (m68knommu) doesn't have some instructions; this caused  
us some grief in the assembly code exported from m68k for byte order  
in user-space.

-
allon
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
