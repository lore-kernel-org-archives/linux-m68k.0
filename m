Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE672E62C6
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 20:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757880806; cv=none; b=EosMKHPZzD0L/tmJXDWEVof7b8bBtwr3Rri9PB3p7xSJCp3bmA91rC3+LEoWEmW3ZIruc+0NeX6UMGEk1xhM/3GEy9SLaPHhxgoPRfrrn2Hh+06kpVgqptq1PI99EolST0b1VEoP5IXrJyoWqaTKx44eRrbGkS/CQVu2FEaG2ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757880806; c=relaxed/simple;
	bh=S1O2mYg/nuSFWiepEfi3INn1/VxeJMAKyzsDV4vYqvg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BY6fRB18KbIR4JI/puneSGgxgJTELX7dH72o3fz9zTfnSznIwyvnOHj6fYWZRn7dsQOKd8rtpnQk5rCWiQD+Y9zRFpRiKIRDxKbgizKwmDqu1ieAGjgx94kKy0ZM4oyxybTLFj011U4iGRBkLF+dBK8KOuGaZedfwTTP6PB/e1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2UPxRGMw; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2UPxRGMw"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B693437D6;
	Sun, 14 Sep 2025 20:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D19C4CEF0;
	Sun, 14 Sep 2025 20:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757880803;
	bh=S1O2mYg/nuSFWiepEfi3INn1/VxeJMAKyzsDV4vYqvg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2UPxRGMw8I/maQZ+HN3ir+gn07zWGBMkkdWTdW2X4OKEgkpUDDbZLiyj3E0pJDtL3
	 1+D42ZKa/D0blrtutGoeATk6sFzQAtpGrIpNKIWACFz+9+7ensOkK9v2abyA5QnetQ
	 dB1gPfBNpyMhvJhlFN9WW4x1lQUIWNYqbIuD5q6A=
Date: Sun, 14 Sep 2025 13:13:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, Al
 Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig
 <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Julian
 Stecklina <julian.stecklina@cyberus-technology.de>, Gao Xiang
 <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, Eric
 Curtin <ecurtin@redhat.com>, Alexander Graf <graf@amazon.com>, Rob Landley
 <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>,
 linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, Ingo Molnar
 <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, "Theodore Y . Ts'o"
 <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek
 <monstr@monstr.eu>, devicetree@vger.kernel.org, Luis Chamberlain
 <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Thorsten Blum
 <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>,
 patches@lists.linux.dev
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of
 root=/dev/ram*
Message-Id: <20250914131321.df00dfc835be48c10f4cce4b@linux-foundation.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
References: <20250913003842.41944-1-safinaskar@gmail.com>
	<20250913003842.41944-22-safinaskar@gmail.com>
	<a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Sep 2025 12:06:24 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> >  Documentation/admin-guide/kernel-parameters.txt          | 3 +--
> >  Documentation/arch/m68k/kernel-options.rst               | 9 ++-------
> >  arch/arm/boot/dts/arm/integratorap.dts                   | 2 +-
> >  arch/arm/boot/dts/arm/integratorcp.dts                   | 2 +-
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dts     | 2 +-
> >  .../boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dts    | 2 +-
> >  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dts | 2 +-
> >  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dts | 2 +-
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dts | 2 +-
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dts    | 2 +-
> >  .../boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi  | 2 +-
> 
> No, don't do that. DTS is always separate.

Why can't DTS changes be carried in a different tree?
