From: =?ISO-8859-1?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Subject: FPU emulation incorrect for 68LC040?
Date: Wed, 21 Jul 2010 22:22:12 +0200
Message-ID: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, zippel@linux-m68k.org, geert@linux-m68k.org

Does anyone know whether a 68LC040 alters the address register in  
postincrement/predecrement modes when it calculates the effective  
address for an FP instruction? The FPU emulation in the kernel seems  
to assume that it doesn't, but that doesn't really make sense.

If the 'LC040 does increment a0 in fadd.d (a0)+,fp0, say, then the  
Linux FPU emulation is quite broken, at least in 2.6.34. If not, then  
I have misunderstood how the hardware works.

I'm writing a 68040/68LC040 simulator and unfortunately do not have a  
real 'LC040 to do experiments on. If someone with actual hardware  
could help me, I'd be most grateful.
