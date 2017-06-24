From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH] pci:  Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Sat, 24 Jun 2017 10:14:07 +0100
Message-ID: <20170624091406.GZ4902__22110.6550460265$1498295676$gmane$org@n2100.armlinux.org.uk>
References: <20170623214538.25967-1-palmer@dabbelt.com>
 <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, catalin.marinas@arm.com, will.deacon@arm.com, geert@linux-m68k.org, ralf@linux-mips.org, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, cmetcalf@mellanox.com, gxt@mprc.pku.edu.cn, bhelgaas@google.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, hch@infradead.org

On Fri, Jun 23, 2017 at 11:01:04PM +0100, James Hogan wrote:
> On Fri, Jun 23, 2017 at 02:45:38PM -0700, Palmer Dabbelt wrote:
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 4c1a35f15838..86872246951c 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -96,6 +96,7 @@ config ARM
> >  	select PERF_USE_VMALLOC
> >  	select RTC_LIB
> >  	select SYS_SUPPORTS_APM_EMULATION
> > +	select PCI_GENERIC_SETUP
> >  	# Above selects are sorted alphabetically; please add new ones
> >  	# according to that.  Thanks.
> 
> This comment seems to suggest PCI_GENERIC_SETUP should be added a few
> lines up to preserve the alphabetical sorting.

Indeed it should.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
