From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/2] compiler-gcc.h: Added new macro for gcc attribute
Date: Tue, 24 Jan 2017 17:50:36 -0800
Message-ID: <1485309036.12563.46.camel__47370.57029638$1485309626$gmane$org@perches.com>
References: <1485260068-2495-1-git-send-email-gidisrael@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1485260068-2495-1-git-send-email-gidisrael@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Gideon Israel Dsouza <gidisrael@gmail.com>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, gerg@linux-m68k.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

On Tue, 2017-01-24 at 17:44 +0530, Gideon Israel Dsouza wrote:
> Added __mode(x) into compiler-gcc.h as part of a cleanup task I've
> taken up, to replace gcc specific attributes with macros.
> 
> Last accepted patch I sent into linux-next for crypto: d8c34b949d8c:
> crypto: Replaced gcc specific attributes with macros from compiler.h
> 
> The last commit of this task that went through you: 52f5684c8e1ec
> kernel: use macros from compiler.h instead of __attribute__((...))
> 
> The next patch is for cleaning up the m68k subsystem and it requires
> a new macro to wrap __attribute__ ((mode (...)))
[]
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
[]
> @@ -121,6 +121,7 @@
>  #define __attribute_const__	__attribute__((__const__))
>  #define __maybe_unused		__attribute__((unused))
>  #define __always_unused		__attribute__((unused))
> +#define __mode                  __attribute__((mode(x)))

Huh?

Perhaps you meant

#define __mode(x)	__attribute__((mode(x)))

?
