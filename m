From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 10:22:50 -0700
Message-ID: <1461864170.2307.19.camel__9412.48155800185$1461864195$gmane$org@HansenPartnership.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: zengzhaoxiu@163.com, akpm@linux-foundation.org, linux@horizon.com, peterz@infradead.org
Cc: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, Geert Uytterhoeven <geert@linux-m68k.org>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Jonas Bonn <jonas@southpole.se>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Chen Liqin <liqin.linux@gmail.com>, Lennox Wu <lennox.wu@gmail.com>, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.orglinu

On Thu, 2016-04-28 at 19:43 +0800, zengzhaoxiu@163.com wrote:
> From: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
> 
> Because some architectures (alpha, armv6, etc.) don't provide 
> hardware division, the mod operation is slow! Binary GCD algorithm 
> uses simple arithmetic operations, it replaces division with 
> arithmetic shifts, comparisons, and subtractions.
> 
> I have compiled successfully with x86_64_defconfig and 
> i386_defconfig.

What's the reason for wanting to optimize this and thus have to
maintain (and test) two separate code paths, which is a significant
expense? As far as I can see, gcd() is mosly used in finding optimal
clocks for operations, which is usually done at start of day and not
time critical.

James
