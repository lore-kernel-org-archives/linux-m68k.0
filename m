From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH] binfmt_flat: make load_flat_shared_library() work
Date: Wed, 29 May 2019 15:18:14 +0200
Message-ID: <f6a74765-8eb8-6170-1f75-1a8ef5835427@physik.fu-berlin.de>
References: <20190524201817.16509-1-jannh@google.com>
 <20190525144304.e2b9475a18a1f78a964c5640@linux-foundation.org>
 <CAG48ez36xJ9UA8gWef3+1rHQwob5nb8WP3RqnbT8GEOV9Z38jA@mail.gmail.com>
 <6956cfe5-90d4-aad4-48e3-66b0ece91fed@linux-m68k.org>
 <7cac8be1-1667-6b6e-d2b8-d6ec5dc6da09@physik.fu-berlin.de>
 <mvma7f5bdu1.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mvma7f5bdu1.fsf@linux-m68k.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-m68k@vger.kernel.org

On 5/29/19 3:16 PM, Andreas Schwab wrote:
>>> I have not used shared libraries on m68k non-mmu setups for
>>> a very long time. At least 10 years I would think.
>> We use shared libraries in Debian on m68k and Andreas Schwab uses them
>> on openSUSE/m68k.
> 
> Nope, I don't use non-mmu.

Sorry, I missed the "non-mmu" part in Greg's mail :).

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
