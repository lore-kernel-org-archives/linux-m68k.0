From: Josh Juran <jjuran@gmail.com>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 13:10:52 -0400
Message-ID: <6FAE0D2C-A593-488B-AE26-E462AF372D8E__25093.1930066601$1461863478$gmane$org@gmail.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: zengzhaoxiu@163.com
Cc: akpm@linux-foundation.org, linux@horizon.com, peterz@infradead.org, Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, Geert Uytterhoeven <geert@linux-m68k.org>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Jonas Bonn <jonas@southpole.se>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Chen Liqin <liqin.linux@gmail.com>, Lennox Wu <lennox.wu@gmail.com>, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp

On Apr 28, 2016, at 7:43 AM, zengzhaoxiu@163.com wrote:

> + * This implements the binary GCD algorithm. (Often attributed to Stein,
> + * but as Knuth has noted, appears a first-century Chinese math text.)

Should this be "appears in a"?

Josh
