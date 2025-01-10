Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67720C017
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jan 2025 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502301; cv=none; b=g9SR0fCddA7+wulWd+Cvpccd9XUGfQHnDVBATWY/asLdaKv2nQpzW8GY8sSNEg8cTKrkqWYkQzPRRWls2yWG2Azmvuc9bcNLThRwHEvWRfLPLrV6qDgpLYDLy/df2SKY6SGC7IIqHxNDR6dDhnU8yOYBrHiR/pVcliUff+noVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502301; c=relaxed/simple;
	bh=ENLLV/0PrVWHZJnSd10hwquS1U8BMVZB3K1bFjotxyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BncVTPoGpCYEp3qMzTtunQ9kBIFz0vO7k/J0HTlXw19i9QrJUz0ZvDTi5L317QmoxzVh2B+GV0iUkGr7PfPgXa0qB3mfoLRr0yISnR2GESSZSj8agYAncy865gbJsy7kcSpWbuPDTiy5mQFCQ0SHRQaYkad706rVGpdkcl0K8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OpFonKHK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OpFonKHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736502296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
	b=OpFonKHK4rsGIFf7HSuUlaFhBRRdsLlK1R0arRX8Qgj5U/1r5D9F44B4TYsKgwx49xHb+n
	5vBk4tEV8CbMFGi4NRmAKUmHTkpEW8Vd0dtx1wt9VRXgkCiiKSc63/ZnsFhVqgMtiikhQ6
	B6aTnOhYbqo/Q402brHq8KN6vSuJqMs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-V6YYGzUgM3W-1dYmuUAMIg-1; Fri, 10 Jan 2025 04:44:54 -0500
X-MC-Unique: V6YYGzUgM3W-1dYmuUAMIg-1
X-Mimecast-MFC-AGG-ID: V6YYGzUgM3W-1dYmuUAMIg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e03f54d0so781391f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jan 2025 01:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502293; x=1737107093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
        b=COOPJcSJ/daVlkzGgIkvGJpHMVpalxoupyhQGtiqBo3L6Nb6riUcWpLjoq0V3cDQVa
         7dDRI7PA7CHN0XPn3uaH0PY+B2bjdsaFb/o4NK2G4RLQMMTs4PXlsmOi/JOq0ZYYK4jk
         3jJno6eBHCU6hiU/hSGx5kxk8QLqvDhI7+JsgMAfCgZXwGArawLOXAeaclqYNcqlmrb9
         67xoA3s22KxvqcQaN+3edHqW4tcJyG+XP1K3uqzns3weH2COdureTz8BvaRJbXolS1cz
         psn2WEUjTOdUIR4hc+qDwpaDuYBz1xHjz05NhtPRldaKyEEULkuIVdn3Mqz9ftoRGzAz
         JCBw==
X-Forwarded-Encrypted: i=1; AJvYcCWjt8W4itJpY6XMfDtFl4kizWxLzLJuwxMYeeqB3mSlclZ77JPUR5RhRzlm7DZgReO9F9odpo8+4kpr@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxNWODfqhgOeG5q/6Qo1xnoj/em2YNfj1bym8eDbIFACbHy+x3X
	WfAVWrJgu72fSJwD+dYJxtI5+LJ/xPv8zbBncS1hE8ut7kareNO88pZwQVKPEeG99bcS7s0J6jn
	sAQkpFfBHe1FI6tgEkbI8N/6j97sn0Eo5aSvXR5OTEpvf7N+fFUDMkReJLLM7jElW
X-Gm-Gg: ASbGncsItY8Tnz573yhc/haiGj1j7vP244IfPvjgI2/tUx1JNJbs5Au95atBDCHAWM1
	dieHKJV0k02jRywxjr9bPhRjTYrACD7Mv0Qe2lVfE29jIlnzdAOZz7i2U3TUy4af2lj/p6as9Nb
	ucoXNf1Ou8RSWnKvauBN/LmLSeji+fBRNiVuji16eWRInd/+q2fms5yIJnYpaS26C4itvvsi9tv
	d9KjOXVghpeeCECQ0Blj3np4YPUg9r+j8yy37dyrQTvIYgg90+X3ZIIfMm8t9xz8vwdkVoDfR1l
X-Received: by 2002:a05:6000:709:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38a8733a1f9mr9910109f8f.45.1736502293470;
        Fri, 10 Jan 2025 01:44:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWMxVaNXeUTe+wjdV2pCbQXCctILb5vVg9f3+psJOjGS23Sr767uuQBsbyCemBlGukLyZjgw==
X-Received: by 2002:a05:6000:709:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38a8733a1f9mr9910059f8f.45.1736502293124;
        Fri, 10 Jan 2025 01:44:53 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383965sm4140444f8f.31.2025.01.10.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:44:52 -0800 (PST)
Date: Fri, 10 Jan 2025 10:44:51 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	Michal Simek <monstr@monstr.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	chris@zankel.net, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <4ad35w4mrxb4likkqijkivrkom5rpfdja6klb5uoufdjdyjioq@ksxubq4xb7ei>
References: <20250109174540.893098-1-aalbersh@kernel.org>
 <e7deabf6-8bba-45d7-a0f4-395bc8e5aabe@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e7deabf6-8bba-45d7-a0f4-395bc8e5aabe@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AGlDng5806W6vQqtwFLrcUfX21i-vufDNtNAKU1Ps14_1736502293
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-01-09 20:59:45, Arnd Bergmann wrote:
> On Thu, Jan 9, 2025, at 18:45, Andrey Albershteyn wrote:
> >
> >  arch/alpha/kernel/syscalls/syscall.tbl      |   2 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       |   2 +
> >  arch/microblaze/kernel/syscalls/syscall.tbl |   2 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     |   2 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    |   2 +
> >  arch/s390/kernel/syscalls/syscall.tbl       |   2 +
> >  arch/sh/kernel/syscalls/syscall.tbl         |   2 +
> >  arch/sparc/kernel/syscalls/syscall.tbl      |   2 +
> >  arch/x86/entry/syscalls/syscall_32.tbl      |   2 +
> >  arch/x86/entry/syscalls/syscall_64.tbl      |   2 +
> >  arch/xtensa/kernel/syscalls/syscall.tbl     |   2 +
> 
> You seem to be missing a couple of files here: 
> 
> arch/arm/tools/syscall.tbl
> arch/arm64/tools/syscall_32.tbl
> arch/mips/kernel/syscalls/syscall_n32.tbl
> arch/mips/kernel/syscalls/syscall_n64.tbl
> arch/mips/kernel/syscalls/syscall_o32.tbl
> 
>        Arnd
> 

Thanks! Added

-- 
- Andrey

