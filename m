Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141A1BA890
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 18:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906975; cv=none; b=rPMJvHwQE0nHJuQBEpfE+9beM0HpZZhlD9sHbMZ4x/BSl+5TW0C/uaD0kNZRM5f+iYmPYDNGpLVJQFxaCOlHjGLboTYzPzES4NjDy+ELgZNZID1vcAGFjdgK//Cpw2MfCTLdSoUxbrqtbmwmsPgOyutT+m10YlnkR0U+JMciIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906975; c=relaxed/simple;
	bh=29OxgEL3l6wtk/wr9HSlAcydEGnms+qvS9bonjZCeq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCq0a4sE4jcmN+Oskg2z2h88tCh1cMV1iFC+QwZ56VqrRsPzMalcJI2m0Sy4bk1zX8u9KR3pfPMGMA+SpTajftePUZTUpnq16teWt503FGcWLKK3rfEVu7Mmar2uQnhCIgCG56ku1E+f4GMT/TyfhPJ6NPN5lxYD2r0ySGMe/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F/Asi2qe; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F/Asi2qe"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso1350532e87.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718906972; x=1719511772; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuatl8An2r1cXJScFESolD1f90VPFvdc9a3mKIi/oro=;
        b=F/Asi2qeIqDOJgkImsos6xpCr4RzNNw0DfVWq6i/Rzr+uSAhqlkDL2os62snwb4j9c
         4tE4eQrP9r9WPstm4DxuqU7HUom6nLenlBS8tesiYnRdXBFmkhvPn1qNxlYvfnnS6dCK
         svKjb6RWm76myvMhbmOr25o44jAwaU/7t0yYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906972; x=1719511772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuatl8An2r1cXJScFESolD1f90VPFvdc9a3mKIi/oro=;
        b=L6odw4O/blNV/ey/dCsMwFFWoRykeyDG/dD1ys4LKPhslC+fl8FwWL88vwEZewylZm
         KVY0z4puYR0NjIrRMN7benhlFcgc+tgpqmbHRYiT7xUB1F43s9y/XW7OMesFGdO60OVi
         BJekcIhtPj8qy6YPuS2mNapfLCvqYHkaeXcYOr/uzrLgMxLcxOJthTFGEeLZHAWLddZ8
         1s+TnZW5SADA2dFOlMllE/ZD3GgyEav0yPUXb9SJ7a4JJ+Y8xELZnPXFrR8HTArj+8As
         5E4wi6u8hfO1XCeg4r+MMcDHGOp4V2vu9XTJYR6WHGTdgyHz8KUHSaq1++TN0pSMO2HM
         YGBg==
X-Forwarded-Encrypted: i=1; AJvYcCXTXjpOzqGUcd7S/ctHNHGtEWOaeu5FEpUNeAI3LBsruRjDYBwI4a1a5KK5Jl8Lbqk0YBeMkSELTPJNcfp96naPSSvWv8NgL9svxCSGZbTQ
X-Gm-Message-State: AOJu0YyhrEfNnQCf/Bb4nw/FbGXt3/83VjU10oqeLVXFunhfYSDce+i8
	spic8jysjhSjxlZiVFSchYW1iHCWv//Qjm8Bs4VPPHAP4+CSpX9ndpyPZ8208hnmMyqgYl8DfEj
	C9soUcss7
X-Google-Smtp-Source: AGHT+IEfIctU5CxiHZVNYrxpBx9DxEonPdwgIxgi8FWWnWZtNJRwkRvXb6xhreyTHlg0pJqnQx0egA==
X-Received: by 2002:a05:6512:36ca:b0:52c:b1f0:44ed with SMTP id 2adb3069b0e04-52ccaa3698bmr4077545e87.37.1718906972090;
        Thu, 20 Jun 2024 11:09:32 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f9c65e4b8sm222176166b.32.2024.06.20.11.09.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 11:09:31 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso13907705e9.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 11:09:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqeJYeM5u/DQI9MlO523zCeJ1FlxDy3cMkK/PvP5rCAx7yR/XnabfrOngYEddoeyyN/SM3GGkWfdROihq6RKW3pYX3M7x8XjVNXojPRX8j
X-Received: by 2002:a50:96cf:0:b0:57c:5874:4f5c with SMTP id
 4fb4d7f45d1cf-57d07ea857fmr5124279a12.32.1718906455555; Thu, 20 Jun 2024
 11:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com>
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 11:00:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
Message-ID: <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	"H. Peter Anvin" <hpa@zytor.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Borislav Petkov <bp@alien8.de>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Disseldorp <ddiss@suse.de>, 
	Edward Cree <ecree.xilinx@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman <gregory.greenman@intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, 
	Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Karsten Graul <kgraul@linux.ibm.com>, Karsten Keil <isdn@linux-pingi.de>, 
	Kees Cook <keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Martin Habets <habetsm.xilinx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Neukum <oneukum@suse.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ping-Ke Shih <pkshih@realtek.com>, Rich Felker <dalias@libc.org>, Rob Herring <robh@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wenjia Zhang <wenjia@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org, 
	ath10k@lists.infradead.org, dmaengine@vger.kernel.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-net-drivers@amd.com, 
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mpi3mr-linuxdrv.pdl@broadcom.com, netdev@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bart Van Assche <bvanassche@acm.org>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jun 2024 at 10:57, Yury Norov <yury.norov@gmail.com> wrote:
>
>
> The typical lock-protected bit allocation may look like this:

If it looks like this, then nobody cares. Clearly the user in question
never actually cared about performance, and you SHOULD NOT then say
"let's optimize this that nobody cares about":.

Yury, I spend an inordinate amount of time just double-checking your
patches. I ended up having to basically undo one of them just days
ago.

New rule: before you send some optimization, you need to have NUMBERS.

Some kind of "look, this code is visible in profiles, so we actually care".

Because without numbers, I'm just not going to pull anything from you.
These insane inlines for things that don't matter need to stop.

And if they *DO* matter, you need to show that they matter.

               Linus
