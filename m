Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986A92F5A3D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Sep 2025 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042515; cv=none; b=hybxeswblgctr89Bg1PPV+mpknyUJl+G9FEOv8pEa6HGAEA+0FqlnWUKoshAErgWWJN3moXVOlYNDFulISCoBC48j1iDaeagquPyXx06BKbz3GmEPupVClepRbkz1QFJBxycb8ZZ+s2HUyjQQnr+ZwR40ULAr2r33MHjkz6MweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042515; c=relaxed/simple;
	bh=PgWcajlgRtwCN1aidp/F0FGsvN0V9p5zYN3VYaOBF0E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C6apTbfE7us3D+lI+RUQo9ox+CrOY+rZg27vcxSWkhn0cHXyRII7rXKm2OBBDgc/4ZbVmhg+12/hPG6+xh07/dJ3KrixxjJMKCazdLwleaAZMdqcq+GsHj4GQiAlVcAvl4NL4fIK/DvqRPsBdSv+c/KjLhoJ+SIbS2PyHk5puJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=RLVWQmAq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="RLVWQmAq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e9ca387425so2246472f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Sep 2025 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1758042511; x=1758647311; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=RLVWQmAqg58L6yCHqmFM5QFaZEJRPDA5p5JNbE02mEN6O809vEn5tDF9JNgx7DpSBC
         rN4hbbawKx1gqf+szUMcd0+5JBk7AHG37xtPzbkCEAmwOc5IM52L+AfqvKuRE07X/Uzz
         Jwa9mWG8dcikg/u3OQHEVT0vkzq2HmagCVaeLU4/z5vByn58sip3IDzbV/C7BM6dvFQr
         7JeGacSDeIfqYhtupLnT0KVoPLxd6I3edW+tPnZQ/wnUelUgJWsnkg5HY483XI9dypEL
         mc/qDgWZHbCpVcEZk8PMSIE0v7z+naB5DMCFXWvcKRhZKednlhAVTu/0A8fOyrNALZIR
         c1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758042511; x=1758647311;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=osuTBJLNjtHWvMyeuY2HoYVXIyzXbAob3fD5jxktajWfSCohq+4FDLa+faO+34z7dK
         5Pq8itz6d/9vsP25e9RaDwfaQH0vzYF3wSk/iFLSmUIVJNKwOJwA8KTGMZzlGgUaTzeK
         T4XCQ6vM3MzHQ+iFv3ZYP+icZsfaB1CxAaUd4Tw02YbMCkllttXmhiI2/bGZcq8SKzZK
         M90tEoGu0NmSmzoNfcUNdqmhJrjggwYZ7nB8QYbdOjEESXAH+EzNhQboJkdy2r+mGr6D
         ueEjsqRSjHi6nub+mtSbuCRPq+bScZJncCAt+ukjzPsNd0rbQfQfW3vy2PLkuhczLZPN
         lSXg==
X-Forwarded-Encrypted: i=1; AJvYcCXMNm7/ZWH/etURMVc6TKaEfINiGjwMm1+UORJywU5aGlulYW+P9V/2gkAGhMU4ACQ/7if5yh6TVr2R@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxP7+RPv9RSKdqc3xi5wz27xFEf8rQsH6Z8Mr9Vowy2e0x7FiC9
	xmd99574pEk6mI4W+92ER6QyCKYzARG+w5N1T/vAvua1qmQBdysPkPkkucqC/jkBAiI=
X-Gm-Gg: ASbGncvEIz/oZh+bxGqLFt0PNzpDaJbgFE1KHqhggJbrHek6IahZIOvIm+a42vIOF23
	zzsQF84V4Pa12hDvOje3pXdxQbV5OrWMLqwqh0va00Ujd9B1mnDNxXhEWwUacWqBmR4nisftZEn
	7AO/F5qJ0nJMKr019R3xzxChd9FU5oLbPmwbmSqMFKI5P6h/y2pYrOvsXlONI66wpfCf64PlUxO
	BRVuxCaY555z5QdZ1lxJHY7Y4t/Ug7YuF7+mx4Mub+T6OQ1lDvmj35yAhAgnPpUg3CmtBXkszrC
	N0sc4bCW/C3kvQ6U+ZvA9sjE2KQWoIfKYm+oVZMJhcJCXX8ar6NWE8dlioEtuewRU++7TZhpka2
	ywZAmCTgHn70ForfxrWzCEtcWMwIzTzQkmDA0oHL5izXM7tbayucocT2aEw==
X-Google-Smtp-Source: AGHT+IGdFovreVsG0VTuKKVTgWJJEqEKFnO21Mo+tI9uoQq7jJrFi/9vVCfXuUmfB6QhCbWUaAaAkg==
X-Received: by 2002:a05:6000:2dca:b0:3eb:2437:97c5 with SMTP id ffacd0b85a97d-3eb24379a13mr7083124f8f.22.1758042510664;
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Received: from smtpclient.apple (nat-184-7.net.cam.ac.uk. [131.111.184.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm22520843f8f.39.2025.09.16.10.08.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 18:08:18 +0100
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>,
 Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>,
 linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 linux-block@vger.kernel.org,
 initramfs@vger.kernel.org,
 linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>,
 patches@lists.linux.dev
Content-Transfer-Encoding: 7bit
Message-Id: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
To: Askar Safin <safinaskar@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)

On 13 Sep 2025, at 01:37, Askar Safin <safinaskar@gmail.com> wrote:
> [...]
> For example, I renamed the following global variables:
> 
> __initramfs_start
> __initramfs_size
> [...]
> 
> to:
> 
> __builtin_initramfs_start
> __builtin_initramfs_size

I strongly suggest picking different names given __builtin_foo is the
naming scheme used for GNU C builtins/intrinsics. I leave you and
others to bikeshed that one.

Jessica

