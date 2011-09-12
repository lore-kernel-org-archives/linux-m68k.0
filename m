From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 02/28] ide-{cd,floppy,tape}: Do not include <linux/irq.>
Date: Mon, 12 Sep 2011 13:59:50 +0400
Message-ID: <4E6DD816.7040809__36196.4280171835$1315822128$gmane$org@ru.mvista.com>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org> <1315742394-16036-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1315742394-16036-3-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org

Hello.

On 11-09-2011 15:59, Geert Uytterhoeven wrote:

> The top of <linux/irq.h> has this comment:

>   * Please do not include this file in generic code.  There is curren=
tly
>   * no requirement for any architecture to implement anything held
>   * within this file.
>   *
>   * Thanks. --rmk

> Remove inclusion of <linux/irq.>, to prevent the following compile er=
ror

    <linux/irq.h>? You've also typoed in the subject.

> from happening soon:

> | include/linux/irq.h:132: error: redefinition of =E2=80=98struct irq=
_data=E2=80=99
> | include/linux/irq.h:286: error: redefinition of =E2=80=98struct irq=
_chip=E2=80=99

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-ide@vger.kernel.org

WBR, Sergei
