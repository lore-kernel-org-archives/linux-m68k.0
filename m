Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71561E5714
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Sep 2025 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757984728; cv=none; b=Ogn1rpvHy4b/DDhyR5s9n3nhrsTw6EqUfpL+7pr+M2CP8+quN8DJgvkluXyD3xb7luVM1lwoemfqhqHcRNfzxM5oIv5E4ncrD6gXhGzxRG0Bd93McnwzCxGLvQhM9o2KR07ypLmelJgfJE7kSnuKyW+OG+c/kEXMmXGyJcIagX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757984728; c=relaxed/simple;
	bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfitUdFPu+H2skQ7qybvigddpcJ+sJAQX/QpQMo0lSKn1NvczV33UspmFQafLwdpA65tU3UK05uwnfzx8PsTyZi3GuEo/sFviZZOmWPrgVcWe7/8iqvEHSyVzcUYOldd9ATfva4Rmq4+GWtSF6XC8eg0c1Tv0Wwh9QdUXB1x7ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ2jVpac; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ2jVpac"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e94d678e116so5035720276.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Sep 2025 18:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757984724; x=1758589524; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=SZ2jVpacmEMSfT89mQq9mzRsooY4wRnt4l+iDZ/OCprax1TvXGKwrSMHWTFoI+YuUY
         Jyhkcgqq7Bb33AgkzIDNm8XOn9UvdmwTuEGnaclIKFrd/IRZDMgD5PF8aBRDIidkWXEh
         NR4h3O8wOXR/6FXoAJIAX30EgSkdVB5P8C2hpR7hjm2dLSL8+T8CplwSMZFs8lOVVClQ
         NAo9rzEWTy9GdnrNu5/jlpztdUxzabsiy89rmzKVnt/hI5/X3X1M3ZcTR8RJUG7idgBZ
         HuTdGo6NKtrG0eEITBg5hrFnADF6BDD8E9BqiqoTGm66f3QWfEy23XL47FyNithXz+hb
         HKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757984724; x=1758589524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=uItE1WNQcg3XWrpTT+3wt29dBsIdYVXT+HfSEQEhOJfE3qU8BwpATDiERzV/dTr1E1
         YsqChTnfLJC6WVekt7W9bJzodQbfJMvGWPx0s0UGLj/PmvuRbCTjUMzRGzuaLGXN/tGs
         isRwIbRqOOlm5oNesMHKybS7CZX2xbM00CEQMIR/J/2KcIcLgn/OPkAhM9hAlqAKX1Dh
         54QwgOh8IhYcttpoFfibww1H6nLnOuA5XsdD5egMFFPtZTpuS6Btlpx5rwaQn5a6AfL6
         8ClF0w219Iq+DvKlYHkiYbkG1c3rzp1ncfydcYMkNvv/UeFY2xd5ED8bMy+NcghTOYvZ
         ZSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGHZgfaMYsQFx+tDHIdUuKSbmV5OW7AtRCe987y9I0mXa+ByGEdPyvRGwfWyoCNEShiEd2O714+Ykq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxFKDUkYzsNa43n+KU3x+iCZo2DLtkBBHAoDYHXJ5YvxYZPSYry
	/4oFQR9yh1F7JwfYeJ8uihxYfgbXw7bYysFezl3JZBi/OWsOtBzqXnoGcV8eCPYCPpPc8cYuwxO
	lQ1sOSsmP/vZGEDltE1i3uhs4xu/AnCs=
X-Gm-Gg: ASbGnct6epp1cDMEljArWMR+Y6gnsOHFncEOVHui8r1A0TVgAbgZzF1vQsE1ktRi/s3
	8AlpHt0cOhbg3hC7sk4YTG/s/FGe1QYip2ci+CvQyvqxwB2aXfQGDQfxprrDpO3Nnmf9IjPSHNY
	DDCpJ/bE6dsKbMROlrrRTv7T0ay6lCwPfRcj6J32H4KqP7t70cTDWApdXus59Vv1jFIJLzTAzq4
	6bqtEj+eVQGh6716w==
X-Google-Smtp-Source: AGHT+IFaJEo1gVHkPCEaCD3vWYjtreYFiQ2WOrRU9CIpbMyg97OVJtr/v3uxdpG+fiXE68E0IfjXLuECnr1bsw09sPQ=
X-Received: by 2002:a05:6902:2b02:b0:e98:9926:e5ca with SMTP id
 3f1490d57ef6-ea3d9a6c911mr10729577276.36.1757984723469; Mon, 15 Sep 2025
 18:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250915-modebranche-marken-fc832a25e05d@brauner>
In-Reply-To: <20250915-modebranche-marken-fc832a25e05d@brauner>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 04:04:47 +0300
X-Gm-Features: Ac12FXwuxsP2xoupllcCoDiRw8q2uuerrvP566PgC2Qr6qfMP36Zqdrto9P8zEU
Message-ID: <CAPnZJGAjfpHZn_VzU3ry9ZV6OUS0RN2iWos153_oM_PhVbMgVg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
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

On Mon, Sep 15, 2025 at 4:34=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> Split it up into multiple patch series. Send a first series that
> focusses only on removing the generic infrastructure keeping it as
> contained as possible. Only do non-generic cleanups that are absolutely
> essential for the removal. Then the cleanups can go in separate series
> later.

Ok, I will do this.
I will send a minimal patchset with arch/ changes kept to absolute minimum
or even absent. Nearly all of the changes will be in init/ and docs.
Hopefully it will pass via the VFS tree.

If it gets to kernel release, I will consider sending more patchsets.


--=20
Askar Safin
