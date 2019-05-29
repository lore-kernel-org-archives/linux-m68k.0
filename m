From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] binfmt_flat: make load_flat_shared_library() work
Date: Wed, 29 May 2019 15:16:38 +0200
Message-ID: <mvma7f5bdu1.fsf@linux-m68k.org>
References: <20190524201817.16509-1-jannh@google.com>
        <20190525144304.e2b9475a18a1f78a964c5640@linux-foundation.org>
        <CAG48ez36xJ9UA8gWef3+1rHQwob5nb8WP3RqnbT8GEOV9Z38jA@mail.gmail.com>
        <6956cfe5-90d4-aad4-48e3-66b0ece91fed@linux-m68k.org>
        <7cac8be1-1667-6b6e-d2b8-d6ec5dc6da09@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7cac8be1-1667-6b6e-d2b8-d6ec5dc6da09@physik.fu-berlin.de> (John
        Paul Adrian Glaubitz's message of "Wed, 29 May 2019 14:32:04 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-m68k@vger.kernel.org

On Mai 29 2019, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> On 5/28/19 12:56 PM, Greg Ungerer wrote:
>>> Maybe... but I didn't want to rip it out without having one of the
>>> maintainers confirm that this really isn't likely to be used anymore.
>> 
>> I have not used shared libraries on m68k non-mmu setups for
>> a very long time. At least 10 years I would think.
> We use shared libraries in Debian on m68k and Andreas Schwab uses them
> on openSUSE/m68k.

Nope, I don't use non-mmu.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
