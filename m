Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0EC3CB2CC
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621970; cv=none; b=UQyjMvG8TG0EIAYlWjs7tCVgpZ/uwk975uEgWp1LwPxeUmMS/upTw+hse2HnwtEJSML4Mk5Fpyx97gWcA2MdupuSD2+9++OWFtwU1PNa0616/FFOdyY4TgvjJNljuU/w3JAsVc7YJngnO07UTxYvzYz1ZmRwFwWsE8KOws4t7JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621970; c=relaxed/simple;
	bh=CuadLq4gnh6A+s/YbTQsNOibHt22WuOTEhntcyj5qbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1jLBRlDdgH8nyGbQjBML07ELnkFKlMRbwZ0L3SpjUfg1Uv1mqt2DYm9H6SeGOApE8xZNGj7pLDQeSzN+f/zTnXORgmxYLUHXmq6VgCv9yzw/riM6R4iTFRNfOoMsSbsHg2CkhAnzuT3LDjGWIh7Meq8E8qUT/FKkRSDbjHWXy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwZzXtvW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwZzXtvW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso214560a91.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621967; x=1784226767; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/JWBZ9pJgvX+aNnWpGPI681HI0WIvMMNN0M2xj5UX4=;
        b=MwZzXtvWuIMX0h8vok4YWDoXXATlaCoKnNjTb530vcFOpn6AenCefH0kwTBhb06K9R
         rkVQgd76d8WRVO5zrzIJJLz7AaGiyZeYVKun4W1qbNHZKIZajmRU4zTC1/eC8tXBSpbl
         3WgTH8qaGb3c+7ppRDp2D9RGrqjvYpufyKiYvuPHVn8N/5j2RkwtqcCJMEiubofjbmm7
         c2b9Db5fsmJ51T2neVZjr2ZMweEVU7YL1jYjIDF5ngCjshWlRBbaec+ApnIOZ2x0zts5
         ixF60ZQnRxQFS1xcpDXraJ+6qRbqAydS3VBaptb7GAo32gLlntcqGFmYrdaIA2YHtSng
         +6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621967; x=1784226767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/JWBZ9pJgvX+aNnWpGPI681HI0WIvMMNN0M2xj5UX4=;
        b=lx/uwEqG4i2xXeZ5v31L/8Uc1VMalEqeZuZcgUAXIvE5T7hHoZAXYicnUDUDgpY3X6
         FH8z/4PYNSLcmfO3eGR8njQ7W5RM0f7A5U3mtM2gv8q+5XhyOl3z94bCn4GWiqA6q5rY
         Zr0+k9PKRI7CbSI2XKU3D73yaQxH8dyDuN6N6vYyW0r1Sb32gKA6VUW5aUF+fJKkftAl
         lLH6ZJ+ex05AX09+Gy/eH7oCy7pYhZSQ58/hDe4uESEADZFDhuVnOFyg8e6b8h5mt12M
         WwVrQqixum4DsLmeB7HBUstpX0jnkBCT/yJXPVaNvY9m3wf9iyJhzp2Bb+RyS0wFgFok
         aCig==
X-Forwarded-Encrypted: i=1; AHgh+Rq9vman8/yruhATt/Yyn8bHJST2aeftn+DjnuBPe0BrzwOP0B27681n86n6bmw8+chJ+6CXQfTym4eD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywy3Rcqa8HDCMiZY/DFj5jcd+ZPyA67U8RoA2/SWGnjbdwVXM12
	D14b1ShqixLMZrc654Ih5rKXTjg4OKU+chb2S4tnml0Y/fgnagQ2q+f7
X-Gm-Gg: AfdE7cn747JJwi/yXhHJi/LTxLvjb91QJn29Z3ThHZIWQxuDZUBhRm0f8X8fhcbjX6z
	RiuAJHzsUsZlVRBHxWX0JCFbxwTszctZ+KPve8ruyBt/lS/0FvPpsoNweoWrl85br4NkHqSkZKD
	DS7o/uMwtMNDdtIEdAAyNZdxkMdK4GC4UDWXHbujmS51/S0VW5MtlAVtNonzwo6Xpo1gmOiyFbC
	t/VkuU/FdBbDQsqhMFNXb4eYdgw2rY4M2bKCuNlHTRgU+SrTN/aRIEL3GK2p8R1UbfJyAQZeBJq
	Mw0aPnMfZeb8qFIp7GI9IEK39S4DQkrgaKFcZiZHsiFysvMYXI4zc2uOoEz+SHdAYjdf9COZoUY
	2ooOKBwGqzXp0xvCsPCVix4Olu3uqAqhUcLTYfnwgPKVVTnGIS0/2aSmcsLpY+GNqbOnCexUDvm
	ednk8qVoi8Vodnw7H1jEa9gsdzPxn+tK/RKFhbdNcOjo8WGpARo66DuzpsrETn8TZfpcRNMfo=
X-Received: by 2002:a05:6a21:3295:b0:3c0:9c18:d5a7 with SMTP id adf61e73a8af0-3c0bd1c4948mr10580989637.68.1783621966489;
        Thu, 09 Jul 2026 11:32:46 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm55669365c88.14.2026.07.09.11.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:32:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:02:27 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
Message-ID: <ak_pE64J_xnLQBMd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.718191130@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.718191130@kernel.org>

On Tue, Jul 07, 2026 at 09:05:58PM +0200, Thomas Gleixner wrote:
> add_random_kstack_offset() is invoked before syscall_enter_from_user_mode()
> establishes state. That's wrong because add_random_kstack_offset() calls
> into instrumentable code.
> 
> Move it after syscall_enter_from_user_mode() to ensure that state is
> correctly established.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org

Thanks for fixing this.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

[...]
