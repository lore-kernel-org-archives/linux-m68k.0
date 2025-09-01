Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCAA33A036
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Sep 2025 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756735164; cv=none; b=CY4LiOkvzebLe5Cq1mqXK5wPQSdtUUlj83fHt+i34e5GZgf/l0xrexct4u1MnbmnztXH2uYhJ0PZJWJLFZj6B66c5QN+BFqoVZJ9xF7/9RI0ckdZ/8UpFWZYvCp5yyU71earqtbLLsffDZAuIWsj/YhhWBID1y8AEAS95w0a2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756735164; c=relaxed/simple;
	bh=oUIhwrLYwstlzlY55FK1ZW41MS2asLYsST3xVM4ctTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrttT4zeGLv4f9pawBKxlpsxrn4eaoyACUuiN82Jkw4F6+WmWziQsb6/rOY9DiQPaubuCINEBbPfduEgrojfdZzcqyk90UArqwF3RmxsPjujvUboc+FdBE9w+M5nnACkhEOiaCfsMf2Tk7AV1Fnf7LS/sO1AuMl4fAc69Qc8nXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3196b9ed1a3so1020639fac.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 06:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756735162; x=1757339962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmDip3pK7R1bCI3jhASK9yPIU2OeMFz+fVnQvMU5RZM=;
        b=unvcXDDbLCCnGKQsmY+LzAuhJFbeYPJHNAixG3nevWT4yARM1BXkxUUzi0PWdCbHMz
         vXC66nDiEia4+jrbXqNQo1WQ12Mz2LWChrg3AkcEFFxgBdSpcxz0XZ1YPz1rfSVJ3VDD
         rrS0YQX/znZM5/xOivmCmwJQ7GsSQKWmtDZn4tr79TP1S9uG86M6SyK0YKmIduF1m/wW
         El+CsKTBKJY/SLqyFGeqm17/rkAlW2YGRO32hdhE9VQouRw27Ze7owkoLcp1kGm17w1H
         5BHXwK5QpJcG9RBt75l5kX1HFeoP5yFH1/39PBZQGgTzE46uCpBzJCYgLgjo3w0ePUdF
         oeaw==
X-Forwarded-Encrypted: i=1; AJvYcCW/ed5dMMtCUFEJ5VPKMaWe3Nm9NcNBYWRrOvwO9uS82wb89xZpruvfVwTsyr60QKtCHi0X8QN6PH39@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyGeQXwEjvIOKeUi8cLuH8KyB9SMRIYYXx7Jub+exJaARsIvaW0
	kpAF3jdZjhssejmtalejPb3bQ8IB1kb3pjv3LXdJ5pQb14HwNn+UPDnHvij9SdYCIhs=
X-Gm-Gg: ASbGncsnvLVKYdIw3WV0J+F/nlTZfThcZPtkEEVfDc4PvH20Lwfuis0seHm+/Ojzc6O
	atX9SolAFmxgve5Z2CmHZNY3OFmcpytmTHCYpWNXkXAG3XuDvBXZhLg+h8AnZDSwEVj+avio8SN
	0DcmmoTpzLXnm7idi1I67Y7QJEAhFCv6AOSvC0G6uM2leShZ2RzBKQPbdIAt8XIn73Ltepmyuuj
	EQkx257Z6WDB1s3AtGfOS00ii11Qm9CvIumAErm/eW9r6xso90I7iKm/Kpuf3uD/uPpHjD/SoTP
	ZrcdzboPRnfW8QOXDX61VvU/eDZipWWkFOF2gSp/VU/NVUx6zYTrbXr27FJAZ5XiHolc+CWlvor
	+bFrwF/86miv2yuTfg4rRGxO/eW6EJp3OcH9+ntedJhPssvPAnQabQb7LddzE
X-Google-Smtp-Source: AGHT+IGbE0P8BX9OfP7VWjswNUQHeGvRCqYpuo7qxTKBwoG42Ey8aGbFH+0u4Uesu9+jILGwiKGIcQ==
X-Received: by 2002:a05:6808:bc4:b0:437:de58:881 with SMTP id 5614622812f47-437f7cfa5e6mr3111025b6e.21.1756735161383;
        Mon, 01 Sep 2025 06:59:21 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437ffea5800sm915868b6e.7.2025.09.01.06.59.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 06:59:20 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-315a0b68314so3799118fac.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 06:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXb2GF83hek8fbEdw9fXy6QENWajJofuX8dJIpq8Fq+ZoeEwT/rmmlnYuo9ts6RGxQF8cNUrzPw8PTE@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3053:b0:52a:c340:11db with SMTP id
 ada2fe7eead31-52b1bb24afcmr2206016137.27.1756734711158; Mon, 01 Sep 2025
 06:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 15:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyCbOgs6XyW=8PG2pVw1-zhWP_VtsXsGz1HeFrZ6kjdA@mail.gmail.com>
X-Gm-Features: Ac12FXxyJUafI_d6iF6chcUi31LuXt_e8cojxsF4wFcxCNHCg2s17r6RQqbjdms
Message-ID: <CAMuHMdWyCbOgs6XyW=8PG2pVw1-zhWP_VtsXsGz1HeFrZ6kjdA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
To: schuster.simon@siemens-energy.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Kees Cook <kees@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	John Johansen <john.johansen@canonical.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com, 
	selinux@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Sept 2025 at 15:10, Simon Schuster via B4 Relay
<devnull+schuster.simon.siemens-energy.com@kernel.org> wrote:
> From: Simon Schuster <schuster.simon@siemens-energy.com>
>
> With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> clone3") the effective bit width of clone_flags on all architectures was
> increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> However, for most consumers of clone_flags the interface was not
> changed from the previous type of unsigned long.
>
> While this works fine as long as none of the new 64-bit flag bits
> (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is still
> undesirable in terms of the principle of least surprise.
>
> Thus, this commit fixes all relevant interfaces of the copy_thread
> function that is called from copy_process to consistently pass
> clone_flags as u64, so that no truncation to 32-bit integers occurs on
> 32-bit architectures.
>
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>

Fixes: c5febea0956fd387 ("fork: Pass struct kernel_clone_args into copy_thread")

>  arch/m68k/kernel/process.c       | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
