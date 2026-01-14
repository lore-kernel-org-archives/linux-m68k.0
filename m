Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597EA3A4ADB
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408753; cv=none; b=inoCzAcXlQRWywu7VjRZDBicP5y7wJ88ZbA+v/GyOZk1j2lbAtghEQmCJIyH51E/UczYEoisqLNK5/LyoESBXqvnRzwLwPjJB0+FExCzR4iBmbRWJnaj+7Nq//pngRCXKZGtlNhwRHtXqNWGR6PPmiuel+A4Pn66Z0jWNk0KWfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408753; c=relaxed/simple;
	bh=3O46Pj7m8kkRm5o6FCiKeQjNffkaPKNOyTPfHDTuyTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBpykQ4Q7p7BxR560ueSk9Q0vHC2o/GEeqMEIEgnO2yibCwkERIYHPN955qENRl2Ga9XGOCJ8LeUkC3S5CoU0u30MeBURyWtfQy8FG0ziRg4Ao4ghnTjRSCpaKFgygvPywpZhGaf8qUqG16EHD4oDFEhWMwGGXomQHueSRjMMKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rX3NXa+Z; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rX3NXa+Z"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A323408E4;
	Wed, 14 Jan 2026 16:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80489C4CEF7;
	Wed, 14 Jan 2026 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768408730;
	bh=3O46Pj7m8kkRm5o6FCiKeQjNffkaPKNOyTPfHDTuyTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rX3NXa+ZIaH3nFwhK4UUCK7Tl+BkdrM7lAWylErEBVX8n4+UiQ4G9G3ZhsgmdM3kk
	 vN8PXFoQ+O9dscO4bKZ3M3QWmyyXJXre63JLVYqnzZ2NTakKl+OU0g0oj8iEefzjr3
	 mgengyjgYNSq8vnqi/nIcJdbHx722ODGLyY8W8WF4jD1J44QYJo3q7W39OBPor2Wnp
	 mtMB1YriAKD7oAMO5DENXpRw1aefTtMKh3nXtSKTmIbbZIhuLzX4/xt9jCGtUk6R4U
	 0bsnyWbYeo3xcvSjczR5clmShq482fExnV7dzxGfD2Q4FGvs3AgYwtJ9KizIe5aoQq
	 liWKl6bOegsTQ==
Date: Wed, 14 Jan 2026 16:38:39 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Daniel Thompson <daniel@riscstar.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Douglas Anderson <dianders@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 00/19] printk cleanup - part 3
Message-ID: <aWfGj1eQhj2fAWB-@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan>
 <aVvF2hivCm0vIlfE@aspen.lan>
 <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
 <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>

On Tue, Jan 13, 2026 at 09:32:33PM -0300, Marcos Paulo de Souza wrote:
> I talked with Petr Mladek and it would need to rework the way that we
> register a console, and he's already working on it. For now I believe
> that we could take a look in all the patches besides the last one that
> currently breaks the earlycon with kgdb and maybe other usecases.
>
> Sorry for not catching this issue before. I'll use kgdb next time to
> make sure that it keeps working :)

As I understood things the bug was in earlycon rather then kgdb.

It was picked up by the kgdbtest suite since kgdb does some cool things
with earlycon (thanks to Doug Anderson) so I added a few earlycon tests
to the kgdbtest suite. However it wasn't kgdb itself that failed here.

So... if you want to run https://gitlab.com/daniel-thompson/kgdbtest
then certainly feel free but its probably less effort just to include
a couple of earlycon checks in your testing.


Daniel.
