From: Srivastava Rajan-B34330 <B34330@freescale.com>
Subject: RE: [PATCH 2/2] Convert PowerPC macro spin_event_timeout() to
 architecture independent macro
Date: Thu, 1 Aug 2013 06:27:36 +0000
Message-ID: <0BFD9FDDD35AA74E9F8151ECAEC49CB139CBE1@039-SN2MPN1-021.039d.mgd.msft.net>
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

-----Original Message-----
From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of Stephen Boyd
Sent: Thursday, August 01, 2013 5:34 AM

>> The answer to your question is that you should not use
>> spin_event_timeout() in interrupt context, because it yields.

> If it yields why are we using udelay? Why not usleep_range()? It would be useful to have a variant that worked in interrupt context and it looked like > that was almost possible.

Looks like the macro yields when 'delay', the third arg to the macro, is zero; otherwise the macro performs one or more udelays. If this is correct, can usleep_range() help?
