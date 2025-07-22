Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC828C2C5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jul 2025 05:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753163625; cv=none; b=gVSaUoNVqQMB5HLmM5HEWLYMx0pvmwHC/u7r+9kqqtFUy4d0C5v+QeY9CBW7XS3MWgPlBX7ZURMugCrzcymm+64WfDM6DIo3QqhfY6+46V261S6/cN/4ubPC02czTuJMvYP3bLF2/pzbhHFCAeF1UME1obrtZxyxkko27rJr1XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753163625; c=relaxed/simple;
	bh=upVSnkCMm3I3aGmUUs+P8F1vsjB3glfV4yq4Rv56GNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzXq2sQF5BuVQaOZOMSJa278ng+qjPnvr8NS9kqezHaDZV1wBM775SqEOhbE+6JzghHpsyTfJXn7ym6vLzVFrgAs/uqUQ1VQhkCSHsNfJBCT/ey+3Js97tGe0GWHWaYzinVgnBSJfnCMn3ms92KAg+oDDWJpEVZJrKtu/Cgp3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fbnzA/9n; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fbnzA/9n"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA5B74551B;
	Tue, 22 Jul 2025 05:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38735C4CEEB;
	Tue, 22 Jul 2025 05:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753163622;
	bh=upVSnkCMm3I3aGmUUs+P8F1vsjB3glfV4yq4Rv56GNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbnzA/9nZYoLNwYogjvQ6VQVnt+3fsJreW1OUBq1lwHSXruWvbEL22FEg+P1gIcJA
	 q9NwilKlSi9s4I9P6WYpdEye8oKBgcMAGwcGWoaQ+zKuk6tzDORozDKkIHrZRJDJ4Z
	 u6GrYJVr5NOClkvEsjAQu6a4TORLBYAwNbvhm4wQ=
Date: Tue, 22 Jul 2025 07:53:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drivers:zorro:zorro-sysfs.c Replace sprintf() with
 sysfs_emit()
Message-ID: <2025072228-comfy-germproof-578d@gregkh>
References: <aH8H3D0WRrqqZYc4@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH8H3D0WRrqqZYc4@brak3rDesk>

On Tue, Jul 22, 2025 at 09:09:08AM +0530, Rujra Bhatt wrote:
> Reply-To: 

Why is this here?

> 
> replace sprintf() with sysfs_emit() in sysfs
> *_show() functions in zorro-sysfs.c to follow the kernel's guidelines
> from Documentation/filesystems/sysfs.rst.
> 
> This improves consistency, safety, and makes the code easier to
> maintain and update in the future.

No, not really.  For new code, always use sysfs_emit().  For existing
code, that you can not even test, just leave it alone unless you can
prove it is wrong.

This code looks fine as-is.  No need to change it unless you really want
to, but there is no requriement.

thanks,

greg k-h
