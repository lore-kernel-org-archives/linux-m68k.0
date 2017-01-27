From: "Gideon D'souza" <gidisrael@gmail.com>
Subject: Re: [PATCH 1/2] compiler-gcc.h: Added new macro for gcc attribute
Date: Fri, 27 Jan 2017 22:50:52 +0530
Message-ID: <CAPNrq4yVFRuZXRof9sPu+QvJmHdfN4sOcbjdXHnkqq1WcvtycQ@mail.gmail.com>
References: <1485260068-2495-1-git-send-email-gidisrael@gmail.com>
 <1485309036.12563.46.camel@perches.com> <CAPNrq4wbhovDcyuNdK84kA1nYtVKcSw42SJGHPsJK68VVuyyyg@mail.gmail.com>
 <CAPNrq4zYukoyRYiH6erX2SwFKVrPfOBhCkKD_Z6kKHmrzGqfFw@mail.gmail.com> <1485524751.12563.124.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1485524751.12563.124.camel@perches.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

>Please don't top post and perhaps Andrew can fix it up instead.

What do you mean when you say "top post" I shouldn't re-send it?

On Fri, Jan 27, 2017 at 7:15 PM, Joe Perches <joe@perches.com> wrote:
> On Fri, 2017-01-27 at 19:04 +0530, Gideon D'souza wrote:
>> Ok, I noticed this went into Andrew's tree and is now in linux-next,
>> should I resend it?
>
> Please don't top post and perhaps Andrew can fix it up instead.
>
> Andrew, you need to change:
>
> #define __mode          __attribute__((mode(x)))
>
> to
>
> #define __mode(x)       __attribute__((mode(x)))
>
> thanks.
>
>> On Wed, Jan 25, 2017 at 10:20 AM, Gideon D'souza <gidisrael@gmail.com> wrote:
>> > > #define __mode(x)       __attribute__((mode(x)))
>> >
>> > Well that's embarrassing. I so sorry for the trouble guys :( I'll resend this.
>> >
>> > On Wed, Jan 25, 2017 at 7:20 AM, Joe Perches <joe@perches.com> wrote:
>> > > On Tue, 2017-01-24 at 17:44 +0530, Gideon Israel Dsouza wrote:
>> > > > Added __mode(x) into compiler-gcc.h as part of a cleanup task I've
>> > > > taken up, to replace gcc specific attributes with macros.
>> > > >
>> > > > Last accepted patch I sent into linux-next for crypto: d8c34b949d8c:
>> > > > crypto: Replaced gcc specific attributes with macros from compiler.h
>> > > >
>> > > > The last commit of this task that went through you: 52f5684c8e1ec
>> > > > kernel: use macros from compiler.h instead of __attribute__((...))
>> > > >
>> > > > The next patch is for cleaning up the m68k subsystem and it requires
>> > > > a new macro to wrap __attribute__ ((mode (...)))
>> > >
>> > > []
>> > > > diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
>> > >
>> > > []
>> > > > @@ -121,6 +121,7 @@
>> > > >  #define __attribute_const__  __attribute__((__const__))
>> > > >  #define __maybe_unused               __attribute__((unused))
>> > > >  #define __always_unused              __attribute__((unused))
>> > > > +#define __mode                  __attribute__((mode(x)))
>> > >
>> > > Huh?
>> > >
>> > > Perhaps you meant
>> > >
>> > > #define __mode(x)       __attribute__((mode(x)))
>> > >
>> > > ?
>> > >
