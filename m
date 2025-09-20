Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73773217705
	for <linux-m68k@lists.linux-m68k.org>; Sat, 20 Sep 2025 03:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758340538; cv=none; b=K2RSA/9yvpjVf51ZxHOBNBLxZz31Oagn71kOecCuGcVhhg3OAEbgAlazRzfptdw2tFzlbKTtz5zTPpOlRKfAMrLfoWEtaXiVv3EijdKdXSsxDlAXEceVtlmRdTfHFjD8UMyj+w3Io2RJWkvttC9XMonNCex7cOPHmXYb3aE736M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758340538; c=relaxed/simple;
	bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+ztk2LstOWH5b/Sj1xd6h3mVQ0E6e7f6FJs2YsDh/Cw9PBfaXrLglzFI9IZh+Wuga6Cri3LYu4tHwXGDOliVTAizg5hJvf+S4EveyEjun7832PSgfDsU+3Ku2eXBakF/wY5zk/6xeXc25nQle09wfV9AbX4/BIDk64M1+nOqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLxLz0P+; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLxLz0P+"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e931c71a1baso3466782276.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Sep 2025 20:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758340534; x=1758945334; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=KLxLz0P+aXa6+yz01jN4X5f9+DWJKK0TdKEdQcvVY8zf7q6hHkbhjdgEnYl6mhtjtj
         0RkuK4ggT8bZVHrdkU1J2mFY/6VNnok6IqZbiuGTSf7vEwseJFtd3MbZyDz6J5twTTPj
         r4Nhovas6KzTDHdaYrrFvqnjU2cllNA65ZFStS9+9qRcIQsi7TBHekBkS9Q0lojB1nLd
         E1lYJvPoW8p2qbprByxp4NunR1nFsC+0E4Mnu+RdJjlwiLD3CGEg12FUcm4pEdadvtyX
         70qJdYIH0OFZJ7auDyTXFZ59yE5OrIWydGcbO1Qqoj4wsSMJAEPfT+YtLLJCbJ3cQX1W
         x74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758340534; x=1758945334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=rIJ8n00ZJ3QVYED3Z4r2/7/UnKWkTwlLAIecS09hD3mNXLNJNwyzDJLTXuB6L3sZ7H
         tXTEUhHexg2gXinYVnr7ols+MNO362KYs8NYzyX3a2ZLKpG1G2uTS0tD7HTeeJ7wZzdu
         m/nxdkDnvGLT4zGawsZtqcQPM6RQXpRphTL1icLTSwFbvCHOsIleOnYIgDl/pPSGDHwj
         3LhL4H5aqdICZiPhd/NoJ1CBwHqKgv0IoIpIrXjm36gxfEicTsa8wLrRwvw3CituY05B
         E0qHJbJ7XuU+uFI1HQoZm/zLorrnO+dprZ+9mCzY59NShtUuMWRhQRglKSC3c3YHg6zl
         RxiA==
X-Forwarded-Encrypted: i=1; AJvYcCXkdiNJPE/MnDAjWYfEmzIHyD3Rghx8hRMQOp1gxfo1G6f6z7EPDvvbUxpinLUppLnIzfoErPh/Yyop@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyGoPla/V5drwKLhdf6BascmtJbnxAWZmkDcwI1U1VjKTJyouWF
	tSzEn0DVEvwRJkAGdddZgntETGSPorkW2rwSkeAbBxdOnFhrNJhv20MiAMpEaXLY8MjIxGF31kO
	gaZwM3GTAAuNwx8uzZlNb+1rVmQMH580=
X-Gm-Gg: ASbGncs8IU4y+DEFIeBPwvzDh3STdDKw6L7yt0EsatsAWFf70e96AOaR5k4hfF921pN
	qsnvXDM7ZUxOKeIZ/3WuBU5NoF7D4Pp/ocvusHdxK/qQb5mG9WFlX7pygsnt8V6dsYDUROgYYd2
	Pd0Gs4TuwsIE+BDy40JcWx9AL6iw+5VAAHH4LOAIUp/oIgxjL2dSXfCMo+zMrT1z6w23HchtW+q
	i+nzjI=
X-Google-Smtp-Source: AGHT+IH7cxRQcDAWrx6iopGK0fgAvvotX/SwRt/T/KElvH4XQULrd96czgOrVv1CSvA0vDpbRNCMKcVlhfdowxEBryU=
X-Received: by 2002:a53:b3c5:0:b0:622:4818:ce38 with SMTP id
 956f58d0204a3-6347f610c7emr3546092d50.37.1758340534336; Fri, 19 Sep 2025
 20:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
In-Reply-To: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 20 Sep 2025 06:54:58 +0300
X-Gm-Features: AS18NWCqg0xtU5KiNe17DWjmiPCEbBI_FSj5NCOyDGZFj_7oFaRqSu7O_vUKCrA
Message-ID: <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 6:25=E2=80=AFPM Nicolas Schichan <nschichan@freebox=
.fr> wrote:
> Considering that the deprecation message didn't get displayed in some
> configurations, maybe it's a bit early at the very least.

I changed my opinion.
Breaking users, who did not see a deprecation message at all,
is unfair.
I will send a patchset soon, which will remove initrd codepath,
which currently contains deprecation notice. And I will put
deprecation notice to
other codepath.

Then in September 2026 I will fully remove initrd.

> SMTP server I used wasn't authenticated to google, so all gmail
> recipients were dropped. Hopefully this work better today.

Yes, this time I got your email

--=20
Askar Safin
