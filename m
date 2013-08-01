From: Goel Arpit-B44344 <B44344@freescale.com>
Subject: RE: [PATCH 2/2] Convert PowerPC macro spin_event_timeout() to
 architecture independent macro
Date: Thu, 1 Aug 2013 09:26:43 +0000
Message-ID: <0DFB48290CDB0C4680160EBE62E8F9A809E9B38B@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1375187900-17582-1-git-send-email-B44344@freescale.com>
 <1375187900-17582-3-git-send-email-B44344@freescale.com>
 <20130731071630.GI8868@codeaurora.org>
 <CAOZdJXVvNBR-qf7LXNOHZVstH_Rebxwn-wAkSaBS53Wn55mYCw@mail.gmail.com>
 <51F9A5FE.8030608@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51F9A5FE.8030608@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Timur Tabi <timur@tabi.org>
Cc: "linux-m32r-ja@ml.linux-m32r.org" <linux-m32r-ja@ml.linux-m32r.org>, "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, "mattw@codeaurora.org" <mattw@codeaurora.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "takata@linux-m32r.org" <takata@linux-m32r.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, "john.stultz@linaro.org" <john.stultz@linaro.org>, Stephen Warren <swarren@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-m32r@ml.linux-m32r.org" <linux-m32r@ml.linux-m32r.or>
List-Id: linux-m68k@vger.kernel.org

Thursday, August 01, 2013 5:34 AM Stephen Boyd [mailto:sboyd@codeaurora.org] wrote:
> BTW, couldn't we skip the first patch and just use usecs_to_jiffies()?

[Arpit] It is a good idea to use usecs_to_jiffies() in spin_event_timeout() implementation. But wont moving USECS_PER_JIFFY from
	  C <arch/time.c> files to include <arch/timex.h> files also required as this would enable using USECS_PER_JIFFY. 	

--
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
