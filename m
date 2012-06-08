From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned
	accesses
Date: Fri, 8 Jun 2012 12:39:31 +0200
Message-ID: <20120608103931.GA26964@frolo.macqel>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay020.isp.belgacom.be ([195.238.6.95]:56153 "EHLO
	mailrelay020.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932682Ab2FHKjf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 06:39:35 -0400
Content-Disposition: inline
In-Reply-To: <1339134180-13630-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Jun 08, 2012 at 03:43:00PM +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>=20
> All current ColdFire CPUs are able to support unaligned memory access=
es.
> So remove the CONFIG_CPU_HAS_NO_UNALIGNED option selection for ColdFi=
re.
>=20
> It seems that the current restriction was inherrited from the early n=
on-MMU
> support for the basic 68000 proecssors - which do not support unalign=
ed
> accesses.

It seems that the first ColdFires needed the restriction :

I read in the "MCF5200 ColdFire Family Programmer=E2=80=99s Reference M=
anual" :

The ColdFire processor default configuration supports word- and
longword-sized operand references on 0-modulo-2 and 0-modulo-4
addresses, respectively. All other references are defined as
misaligned accesses. Any attempt to access a misaligned operand
generates an address-error exception, unless the optional hardware
module for handling misalignment is present. This misalignment
module converts any misaligned operand references into a series
of aligned bus cycles to access the data. The existence of the
misalignment module is implementation-dependent and is documented
in the appropriate ColdFire user=E2=80=99s manual.

Philippe
