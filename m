From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/9] Removing dead code
Date: Fri, 27 Aug 2010 09:14:32 +0200
Message-ID: <AANLkTimeUV9rS_b8YP9bgfBE+CvrjK+D7z0JGML3j8-H@mail.gmail.com>
References: <cover.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
	<4C5F9715.1030806@snapgear.com> <86tyn4ximi.fsf@peer.zerties.org>
	<861v9ptzex.fsf@peer.zerties.org>
	<AANLkTimiLhhTW=XRD4hSdsKxnNdKaMSDLUgOeVR=SCJf@mail.gmail.com>
	<4C7757B1.9060403@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <4C7757B1.9060403@snapgear.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, John Stultz <johnstul@us.ibm.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Alexander Kurz <linux@kbdbabel.org>, linux-mtd@lists.infradead.org, Michael Roth <mroth@nessie.de>, Greg Ungerer <gerg@uclinux.org>, Christoph Hellwig <hch@lst.de>, Finn Thain <fthain@telegraphics.com.au>, Tony Lindgren <tony@atomide.com>, vamos-dev@i4.informatik.uni-erlangen.de, Lennart Sorensen <lsorense@csclub.uwaterloo.ca>, Russell King <rmk+kernel@arm.linux.org.uk>, Anatolij Gustschin <agust@denx.de>, Sam Creasey <sammy@sammy.net>, linux-pcmcia@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>, Sean MacLennan <smaclennan@pikatech.com>, Joe Perches <joe@perches.com>, Maxim Kuvyrkov <maxim@codesourcery.com>, Thomas Gleixner <tglx@linutronix.d>
List-Id: linux-m68k@vger.kernel.org

T24gRnJpLCBBdWcgMjcsIDIwMTAgYXQgMDg6MTQsIEdyZWcgVW5nZXJlciA8Z2VyZ0BzbmFwZ2Vh
ci5jb20+IHdyb3RlOgo+IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPj4KPj4gT24gTW9uLCBB
dWcgMjMsIDIwMTAgYXQgMTI6MDcsIENocmlzdGlhbiBEaWV0cmljaAo+PiA8cXkwM2Z1Z3lAc3R1
ZC5pbmZvcm1hdGlrLnVuaS1lcmxhbmdlbi5kZT4gd3JvdGU6Cj4+Pgo+Pj4gQ2hyaXN0aWFuIERp
ZXRyaWNoIDxxeTAzZnVneUBzdHVkLmluZm9ybWF0aWsudW5pLWVybGFuZ2VuLmRlPiB3cml0ZXM6
Cj4+Pj4+Cj4+Pj4+IEkgZG9uJ3QgaGF2ZSBhbnkgcHJvYmxlbXMgd2l0aCBhbnkgb2YgdGhlc2Ug
ZnJvbSBhCj4+Pj4+IG02OGtub21tdSBwb2ludCBvZiB2aWV3LiBJIGNhbiBtZXJnZSB0aGVtIHZp
YSB0aGUKPj4+Pj4gbTY4a25vbW11IGdpdCB0cmVlIGlmIHlvdSB3YW50Pwo+Pj4+Cj4+Pj4gSWYg
dGhlcmUgYXJlbid0IGFueSBjb21wbGFpbnRzIGZyb20gdGhlIG02OGsgcGVvcGxlIGknbSBmaW5l
IHdpdGgKPj4+PiB0aGF0Lgo+Pj4KPj4+IEhtLCBsYXN0IG1lc3NhZ2Ugd2FzIHR3byB3ZWVrcyBh
Z28sIHNvIHBlcmhhcHMgdGhlIG02OGsgcGVvcGxlICh3aXRoCj4+PiBtbXUpIGhhdmUgbm8gY29t
cGxhaW50cyB3aXRoIHRoZXNlIHBhdGNoZXMgYW5kIHRoZXkgY2FuIGJlIGluY2x1ZGVkIGluCj4+
PiB0aGUgbTY4a25vbW11IHRyZWU/Cj4+Cj4+IFNvcnJ5LCBJJ3ZlIGJlZW4gYSBiaXQgdG9vIGJ1
c3kgd2l0aCBvdGhlciB0aGluZ3MuLi4KPj4KPj4gwqAtIGFyY2gvbTY4azogUmVtb3ZpbmcgZGVh
ZCBHRzIgY29uZmlnIG9wdGlvbgo+PiDCoCDCoEZpbmUgZm9yIG1lCj4+IMKgLSBhcmNoL202OGt7
LG5vbW11fTogUmVtb3ZpbmcgZGVhZCBTTVAgY29uZmlnIG9wdGlvbgo+PiDCoCDCoEFyZSB0aGVy
ZSBhbnkgU01QIG02OGsgc3lzdGVtcyBjb21pbmc/Cj4+IMKgIMKgSWYgeWVzLCB3ZSBtYXkgd2Fu
dCB0byBrZWVwIGl0LiBGcm9tIHRoZSBvdGhlciBoYW5kLCBwcm9iYWJseSBtYW55Cj4+IG90aGVy
IHBsYWNlcwo+PiDCoCDCoG5lZWQgYWRqdXN0bWVudCBmb3IgU01QIHRvbywgc28gdGhlIGZldyBj
aGVja3MgZm9yIENPTkZJR19TTVAgbWF5IGdpdmUKPj4gYQo+PiDCoCDCoGZhbHNlIGZlZWxpbmcg
b2YgcmVhZGluZXNzIGZvciBTTVAuCj4+IMKgLSBhcmNoL202OGtub21tdTogUmVtb3ZpbmcgZGVh
ZCBNNjhLRlBVX0VNVSBjb25maWcgb3B0aW9uCj4+IMKgIMKgV2l0aCB0aGUgaW1taW5lbnQoPykg
bWVyZ2Ugb2YgbW11IGFuZCBub21tdSwgcGVyaGFwcyB3ZSB3YW50IHRvIGtlZXAKPj4gaXQ/Cj4K
PiBJIHRoaW5rIHdoYXQgaXMgaW4gdGhlcmUgaXMgc28gb2xkIGFuZCBkZWNyZXBpdCB0aGF0IGl0
IGlzIG1vcmUKPiBvZiBhIGhpbmRyYW5jZSB0aGFuIGEgaGVscCA6LSkgwqBXaGVuIHdlIG1lcmdl
IHdlIHNob3VsZCBqdXN0IGJlCj4gdXNpbmcgd2hhdCBpcyBjdXJyZW50bHkgaW4gdGhlIG02OGsg
cGFydCBvZiB0aGUgc291cmNlLiBTbyBJIGFtCj4gaGFwcHkgdG8gcmVtb3ZlIHRoZSBtNjhrbm9t
bXUgRlBVIGNvZGUgcmlnaHQgbm93LgoKT0ssIGZpbmUgZm9yIG1lIQoKR3J7b2V0amUsZWV0aW5n
fXMsCgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBHZWVydAoKLS0KR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgwqDCoCAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
