Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1652C2340
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Oct 2025 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008782; cv=none; b=Qp7565dNFlrm76RIuoXToPl0NnDDnYO8Okpm35PRjkweJxWUadtEqZuzxfJG1k5AcLFN7acctdNw83GOrd0DEJG5SmWY08Cp7lmHlq8Xdz2lTb6BJDNrlm5O7s7NQG8yqtN0T+ToyiBFLldOOuC3CUAG4wAJJmgC3ga1Nl8tcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008782; c=relaxed/simple;
	bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt+v0fp7UjlosFA26+VcZoX8VEn2AabsA1OteRt+OCkrR5fQT99//rydRsVi5LcvEV7TDjr1lCUDpkWCaslgmof8ODYPTNTsk6DgCQywxIs0Zv/+ffZTo+UoAy3EWQjf23/k0l87h4sMPdlIq3RzLN/nJhwrwEic93SLeLJ/8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIzvWEiM; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIzvWEiM"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-749399349ddso10294597b3.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Oct 2025 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008779; x=1760613579; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=PIzvWEiM57ufNozB6GhwV7DpdsvkY31hE8fpvm0Tub964aGsavqelK54yJnjxTXxjz
         5jRfq304jOXuFme6YZ2CluI3RFOzJt54hyRE9m+Qmdypgt3h1kL3XzXy6qe3zX4thq+s
         4yKy6dGXTzbYFXSwcVenOv41d7hRD13u+p7GUdrxhsCiImC+l6+i4cdqWwmt7NF/jCKn
         VJLfT7Eh1Q+81wVE35guYACyeQ1dEANOfpJMz8mJ+/8yENgrMtbFiPQ3PH7EFZpicn/W
         ry51zkFq0Yhp6Gf4JjufPp6CDPBlPT3HkBruDMzAgaLC7wpDzuwvzQAvx5PAFqdPp3d4
         f5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008779; x=1760613579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=XoLXNVrz+4p6DSiYlRbkqy9jBxIHmKFcMBYWhy+/ebWJtA/ElCSZ8dASLI5pqrhn81
         JDILjrfqQyYvIULAMEl3ZDYqYwebgUL1PoXAZjLitHDTicbzW4rInRXrS4ojbqWXRPjA
         hriN2sXt+EqtpTEvN7JVZ6vC44w/owGjN8qWCLDJCQr8bHW2a4kdW/ZCdFB/Ey5R/wvP
         y/mx8zXlVhjiWx7gJ6v3gPPK68SQXM0LfZj1q2wZRs3VKajhBRH+fs+SFL3sFcxXpQgX
         oOBuN3DKRHQe86mN85sfxbx6KziseXNDvNOsJP4if5ya1ScxoeX9NW0X7E2qOdMEaKUo
         iMEA==
X-Forwarded-Encrypted: i=1; AJvYcCVsbwxAjeus4vM1K/zPVoYzVGT1LuQAK/+Gxp8nnwZPUgpNMP42OcrQSx9fjmmKywrlVrhRFMjfsyvc@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxO/LXOmAs51hHtqS3fCaHNtVjQ+cvJea4503hvkfmDEPV4QprZ
	vMINRBgYVWekCNJIny9jdz1r3WS+ByZW+mO2GCcgE+8u80Ai2V0zFHvBJpkeRTmFsWqUt9aHQA5
	tftMpLxoFdrdBZ4JR72J8Nlu8BxG7gWs=
X-Gm-Gg: ASbGncvjNR+2HFBXr+qqp0CDUE8vLYKUkUxTzv20yqGZljDUvdxLfSoPIKhTFTDuI/6
	yQUHQj4JkES/esEwmgTFBoqxkL8LfLk5yIyR+yAKDpNUkUrzLzT4KBDX89cnQ6/46QamVX9LYkb
	pHwMoszfkCNXmaec8X/p/og/ufoz8BXAni9CEZHr6Myv+zsKIuUV4DJs7M0223/VAfCH+GdINLF
	59hBxudDcSrkxDQSXnKHuowE1+tRAM=
X-Google-Smtp-Source: AGHT+IE5U7JyGi1AmeLjDi25hUOta+sU2hpJbVTN9Ai63ARDyOdLqRjdCN3h5Wr4u+tqZlHZJ+/pg/7Xr5jCWFq4BIc=
X-Received: by 2002:a53:d048:0:10b0:63b:8e80:c017 with SMTP id
 956f58d0204a3-63ccb672a0emr6807745d50.0.1760008779377; Thu, 09 Oct 2025
 04:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local> <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
In-Reply-To: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 14:19:03 +0300
X-Gm-Features: AS18NWAGN6ExXhEWeXK-ERFvGpf6JdjWShiWpIPYOnPjMCR9bXVHwIY8E_1WxIc
Message-ID: <CAPnZJGBwFqNAybORpTtRfjtGwMQiBtd+rATD=mh8ZgE3owT_ow@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Borislav Petkov <bp@alien8.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
> Ooh, now I see it - you have virtual and physical initramfs address thing=
s. We
> usually call those "va" and "pa". So
>
> initramfs_{va,pa}_{start,end}

Okay, I will call external_initramfs_{va,pa}_{start,end}
(after I will remove initrd, which will happen after a year)

"external" means "bootloader-supplied" as opposed to builtin initramfs.

--=20
Askar Safin
