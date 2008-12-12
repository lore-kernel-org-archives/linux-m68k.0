From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Re: Merge headerfiles for m68k and m68knommu to
	arch/m68k/include/asm
Date: Fri, 12 Dec 2008 15:22:56 +1000
Message-ID: <4941F530.8000003@snapgear.com>
References: <20081208205814.GA22697@uranus.ravnborg.org>
	<Pine.LNX.4.64.0812082359190.29640@anakin>
	<2929E10F-8611-41C9-8B15-C734AA7D7820@argonst.com>
	<Pine.LNX.4.64.0812091838500.27084@anakin>
	<EB7A6806-7754-4EB5-8CCB-BCDE7380194D@argonst.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <EB7A6806-7754-4EB5-8CCB-BCDE7380194D@argonst.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Allon Stern <Allon.Stern@argonst.com>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org


Allon Stern wrote:
> On Dec 9, 2008, at 12:39 PM, Geert Uytterhoeven wrote:
>> Sure, but that one is nicely protected by "#if defined 
>> (__mcfisaaplus__) ||
>> defined (__mcfisac__)", right?
> 
> Well, that was the patch we had to apply.
> It wasn't in the baseline kernel.org kernel.

What kernel.org version?
Its has been in for a little while.
In 2.6.28-rc8:

grep mcfisaaplus arch/m68knommu/include/asm/*

arch/m68knommu/include/asm/bitops.h:#if defined (__mcfisaaplus__) || 
defined (__mcfisac__)
arch/m68knommu/include/asm/byteorder.h:#if defined (__mcfisaaplus__) || 
defined (__mcfisac__)


Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
