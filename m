Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0437B032
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486770; cv=none; b=Swl/+ou21/Kh8xW3lN2Eys8SJrQqZ2Vhmu88asfaoxJ5IYp0x/fO82KH+mV4zRJ7FtHBm0QUqz/gmhgajbJ10BMSouja89+kOsz0Qk6DiXiI5RQcfXN+w/qaQG2+IZk41MkNEIO0mjK8YsQPwBm8sf94HUoa255yfPqKbZpXJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486770; c=relaxed/simple;
	bh=URVGzuHIflYeNJz6g9E3Ox4vIR8LOpddiDa8EjwitvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6T4NZXM7VgF5eUC29iKPYg+MzKzopb+ROxn2/H1gEd2HIVVIydg02FgoQ2PrtXvjRyJD9E0ojM7bsWU5xeidSoYE+a4yAbHcd5qTL9a5FfnwNGgkUQB82RGv+iKQHOIVaqHy3GhfvGDQIQJZcSsWVb5csROxPyRjMN+qPM04D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h1EIacxe; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h1EIacxe"
Date: Fri, 26 Jun 2026 17:12:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782486761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t6iIeO6NV5lFndJuAEd9nbzQsVfSydk9GdGnQOtrpxI=;
	b=h1EIacxeE1w3CXf0nhSDyShDtAtEQyP6Kpc8zVG5NYKBTpXbAaF4GTLckrORF6jZArbogl
	WZ46jps0h/OXFk0dzwWXSMSZb4w0534I2vRHDgjqRsCDJJSI64iGtJ8LSpH6zxxxyt87Bt
	0JSgHq9Bem/lrLlfR8IymJn9ZPfwGz4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] m68k: amiga: Mark amiga_reset() as __noreturn
Message-ID: <aj6W5U98q3wWCFqO@linux.dev>
References: <20260626145731.64010-2-thorsten.blum@linux.dev>
 <CAFr9PXn8b8ZUk_OFLTum6Q_a19XNRwu61usgda61jfxMVvZqYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXn8b8ZUk_OFLTum6Q_a19XNRwu61usgda61jfxMVvZqYQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Jun 27, 2026 at 12:07:30AM +0900, Daniel Palmer wrote:
> Hi Thorsten,
> 
> On Fri, 26 Jun 2026 at 23:58, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> >
> > Mark both the forward declaration and the function definition as
> > __noreturn, and remove the redundant redeclaration.
> <snip>
> 
> Boot tested on my A4000, rebooting still works. So FWIW:
> 
> Tested-by: Daniel Palmer <daniel@thingy.jp>

Thank you!
