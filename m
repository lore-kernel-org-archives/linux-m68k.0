From: Timur Tabi <timur@tabi.org>
Subject: Re: [PATCH 2/2] Convert PowerPC macro spin_event_timeout() to
 architecture independent macro
Date: Wed, 31 Jul 2013 19:02:12 -0500
Message-ID: <CAOZdJXW8uF_e2nQr3gAiMf4E5pvsH_S-ztAXvx9R7-nXyaZGag@mail.gmail.com>
References: <1375187900-17582-1-git-send-email-B44344@freescale.com>
	<1375187900-17582-3-git-send-email-B44344@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <1375187900-17582-3-git-send-email-B44344@freescale.com>
Sender: sparclinux-owner@vger.kernel.org
To: Arpit Goel <B44344@freescale.com>
Cc: linux@arm.linux.org.uk, takata@linux-m32r.org, philb@gnu.org, Geert Uytterhoeven <geert@linux-m68k.org>, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, linux390@de.ibm.com, David Miller <davem@davemloft.net>, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@nvidia.com>, john.stultz@linaro.org, jesper.nilsson@axis.com, gregkh@linuxfoundation.org, sam@ravnborg.org, linux-m32r-ja@ml.linux-m32r.org, linux-s390@vger.kernel.org, linux-m68k@vger.kernel.org, linux-m32r@ml.linux-m32r.org, lkml <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Jul 30, 2013 at 7:38 AM, Arpit Goel <B44344@freescale.com> wrote:
>
> +#ifndef spin_event_timeout
> +/**


Why don't you make PowerPC also use this generic version?  It seems
silly to have two virtually identical implementations of this macro?
