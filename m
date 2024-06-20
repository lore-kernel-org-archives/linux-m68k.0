Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971D22EED
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 20:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915566; cv=none; b=sLwVO6J9g3nCz82IRyc5yWjTgSa5VmgvS82iYiTkhNvXY5jyb7z91rnoY2h4sYNr0/agvzOh44g7UuBIUBIHT2Lcx/qk856h1ofyfsEK/xIG7t4s1D4Dbgcahzg6U5OPcZVaBr/mJ956iFUWRFqEFEWS7zxl9RP5f63tYCKFndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915566; c=relaxed/simple;
	bh=xe0CLiytQL+w07wMVqUc1rJS0v+e/Ti6ErqFWmVCp7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgZgLlZlRqL48QMKUVfUk7hJ8B1NXNn/8AkUn4Ez1zu3X6ctaKyBtVfmqJ+YbfteX6K0fCKLI1dWCDiXi4JT7ppm2aq3CVrGJmxK2TEXKkavnm3SATDqhP3RbywR+0pU37horUGaGd4+/CQcWDC0Wo48ucB8VJW0PssYslSb7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LHxlARIg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LHxlARIg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso134153166b.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718915563; x=1719520363; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=LHxlARIg2uDK2ov/YRUbPFEpbeP5+KKMSaKfJD0kCgnNCM1mN3/Wm0Tiv7LNA2sJD3
         v8tT1zg1jLI76GFnWZJ3zJPoSAxgxNSQXqClwI58vamF3c2PkivpI5WXsKwxgYjSf0ki
         4HgZp3GQBi1xt/qe+vzYBbA6QE3DBcpKBLfK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915563; x=1719520363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=QI9ggaMeiRtAu2ejDet4zQlLxhoOcjr1IDsquWGG9L34mZuD+sF4F9cZeL/IFKhI6F
         meJBVgCB4m5ZFdg1+JonKTEh7wpfKlSZn2+DxgYrqED7Eo7S9X6Dl1kCvM3z3onrbsca
         rcZAOHv1QcZo6O1eP5pXHt85rgiFA9SzfqKyqC/BUBrPbv60q4GLQGdqTctmgFXbjs1A
         vyBfqY5D9GXcAsXB64lE9RgucxGhI+PdEdedpZWxuwDU4GEZZb+XFm14uSmAi38p+oxD
         Lh4aPyQjO9CvnY12+iKqrngO7PlYLsd1seKYXB8LhjiPu8mjrQzYztiZBO1q6sWweC8t
         mpVw==
X-Forwarded-Encrypted: i=1; AJvYcCVK8OVHW0JikMR5wSFdq25+jc2+VssBMlu7j84CCxdwpTCgyh8TNykKsTLtBL7zRXzuO5yKlPoEUa22OMNvQbXc6XyWZ0wEsUivExsiFJBe
X-Gm-Message-State: AOJu0YwAOUvxUsQXOy5/xzV5StPrMNjcFxwdPiMjphYLsce6lUCm3Y3X
	MhtOGiV3ot4YpwaOCo7OZmtXSe+5eiH5ByhhK3QQEbFDFfbV7oV6FonpMG28AAzpiNuExxO+5oe
	BBF+sHQ==
X-Google-Smtp-Source: AGHT+IHZw8AzWXWyZXEBzQ9RAKh4sPsl+N79YKH5uXd5F80H8yMX9jgfQ8f/tAYn6IZiRFlmLO2awA==
X-Received: by 2002:a17:906:7003:b0:a6f:510b:5c88 with SMTP id a640c23a62f3a-a6fab7cd4c2mr319639966b.75.1718915563118;
        Thu, 20 Jun 2024 13:32:43 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf5492d2sm7283066b.107.2024.06.20.13.32.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 13:32:42 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424720e73e0so13245555e9.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 13:32:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjNw6Rg1upyy6w5cdQMssyaL2O2Qio7kKZX5TiQx/jKRqugKsC9yM06H+2AUpyqnV/inhr90pR66Qv8el4ZoZy76EEf6WVBHlAqurWcsTM
X-Received: by 2002:a17:906:1348:b0:a6e:2a67:7899 with SMTP id
 a640c23a62f3a-a6fab63aaabmr312193466b.35.1718915542284; Thu, 20 Jun 2024
 13:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com> <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad> <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
 <ZnSPBFW5wL0D0b86@yury-ThinkPad>
In-Reply-To: <ZnSPBFW5wL0D0b86@yury-ThinkPad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 13:32:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
Message-ID: <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
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

On Thu, 20 Jun 2024 at 13:20, Yury Norov <yury.norov@gmail.com> wrote:
>
> FORCE_NR_CPUS helped to generate a better code for me back then. I'll
> check again against the current kernel.

Of _course_ it generates better code.

But when "better code" is a source of bugs, and isn't actually useful
in general, it's not better, is it.

> The 5d272dd1b343 is wrong. Limiting FORCE_NR_CPUS to UP case makes no
> sense because in UP case nr_cpu_ids is already a compile-time macro:

Yury, I'm very aware. That was obviously intentional. the whole point
of the commit is to just disable the the whole thing as useless and
problematic.

I could have just ripped it out entirely. I ended up doing a one-liner instead.

                Linus
